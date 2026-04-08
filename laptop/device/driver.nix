{ config, pkgs, ... }:

{
  # ... 其他設定 ...

  # 強制蓋掉 nixos-hardware 的預設驅動版本
  # 對於 GTX 950M (Maxwell)，建議使用 legacy_580
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

  # 確保你的 Bus ID 設定依然存在
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
