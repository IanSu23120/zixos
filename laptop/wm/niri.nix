{ pkgs, inputs, ... }:
{
  imports = [
    inputs.niri-flake.nixosModules.niri
  ];
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  niri-flake.cache.enable = true;
  # windowManager
  programs.niri = {
    package = pkgs.niri-unstable;
    enable = true;
  };

  # 開機動畫
  boot = {
    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = [ (pkgs.catppuccin-plymouth.override { variant = "mocha"; }) ];
    };
  };

  # 登入session
  services.displayManager.ly.enable = true;

  # file-explorer
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    # enable thunar can detect USB
    gvfs = {
      enable = true;
    };

    gnome.gnome-keyring.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-termfilechooser
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [
        "termfilechooser"
        "gnome"
        "gtk"
      ];
      niri = {
        default = [
          "termfilechooser"
          "gnome"
          "gtk"
        ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    xwayland-satellite

    brightnessctl

    adwaita-icon-theme

    pavucontrol

    xclip

    p7zip
    unzip
  ];
}
