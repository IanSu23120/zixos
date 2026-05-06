{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
  };
  home.packages = with pkgs; [
    lua-language-server
    stylua
    nixd
  ];
}
