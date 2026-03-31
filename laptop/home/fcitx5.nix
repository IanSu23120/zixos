{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = false;
      addons = with pkgs; [
        kdePackages.fcitx5-qt
        fcitx5-gtk
        fcitx5-chewing
        qt6Packages.fcitx5-configtool
      ];
    };
  };
}
