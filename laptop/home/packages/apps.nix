{pkgs, ...}: {
  home.packages = with pkgs; [
    rofi
    obsidian
  ];
}
