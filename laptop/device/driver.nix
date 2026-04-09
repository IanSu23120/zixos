{
  config,
  pkgs,
  lib,
  ...
}:

{
  # 1. 定義開關選項 (只需在 configuration.nix 設為 true 即可啟用)
  options = {
    hardware.nvidia.primeBatterySaverSpecialisation = lib.mkEnableOption "NVIDIA Prime 電池省電特殊模式";
  };

  config = {
    # --- 系統基礎電源管理 (TLP) ---
    services.tlp.enable = lib.mkDefault true;
    services.power-profiles-daemon.enable = lib.mkDefault false;
    services.fstrim.enable = lib.mkDefault true;

    # --- Intel 內顯優化 (移植自 nixos-hardware 原始碼) ---
    boot.kernelParams = [ "i915.enable_guc=2" ];
    boot.initrd.kernelModules = [ "i915" ]; # 提前載入驅動防止開機閃爍

    hardware.graphics = {
      enable = true;
      # 這裡實作了你看到的 .override { enableHybridCodec = true; } 邏輯
      extraPackages = with pkgs; [
        (intel-vaapi-driver.override { enableHybridCodec = true; }) # 舊款 Intel 硬解強化
        intel-media-driver # 現代驅動
        intel-compute-runtime-legacy1 # 針對 Gen8-11 的運算支援
        vpl-gpu-rt # 媒體運行時
      ];
      extraPackages32 = with pkgs.driversi686Linux; [
        (intel-vaapi-driver.override { enableHybridCodec = true; })
        intel-media-driver
      ];
    };

    # 環境變數：確保影片播放優先選擇最穩定的 i965 驅動
    environment.variables = {
      LIBVA_DRIVER_NAME = "i965";
    };

    # --- 基礎 NVIDIA 設定 (所有模式通用) ---
    hardware.nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        # 預設模式：Hybrid / Offload (自動判斷)
        offload = {
          enable = lib.mkOverride 990 true;
          enableOffloadCmd = true;
        };
      };
      powerManagement = {
        enable = lib.mkOverride 990 true;
        finegrained = lib.mkOverride 990 true;
      };
      primeBatterySaverSpecialisation = true;
    };

    # 預設桌面驅動
    services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];

    # --- 特殊模式：Battery Saver (開機選單切換) ---
    specialisation = lib.mkIf config.hardware.nvidia.primeBatterySaverSpecialisation {
      battery-saver.configuration = {
        system.nixos.tags = [ "battery-saver" ];

        # 強制切換驅動，保證 i3 進得去
        services.xserver.videoDrivers = lib.mkForce [ "modesetting" ];

        # 停用 NVIDIA 功能
        hardware.nvidia.prime.offload.enable = lib.mkForce false;
        hardware.nvidia.powerManagement = {
          enable = lib.mkForce false;
          finegrained = lib.mkForce false;
        };

        # 徹底封印 NVIDIA 驅動模組
        boot.blacklistedKernelModules = [
          "nouveau"
          "nvidia"
          "nvidia_drm"
          "nvidia_modeset"
          "nvidia_uvm"
        ];

        # 物理級移除：透過 udev 直接在 PCI 匯流排上拔除顯卡
        services.udev.extraRules = ''
          ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
          ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
          ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
          ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
        '';

        boot.extraModprobeConfig = ''
          blacklist nouveau
          options nouveau modeset=0
        '';
      };
    };
  };
}
