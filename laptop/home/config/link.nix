{ config, ... }:
let
  configPath = "${config.home.homeDirectory}/zixos/laptop/home/config";
in
{
  xdg.configFile."i3".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/i3";
  # xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/niri";
  # xdg.configFile."xdg-desktop-portal".source =
  # config.lib.file.mkOutOfStoreSymlink "${configPath}/niri/xdg-desktop-portal";
  # xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/rofi";
}
