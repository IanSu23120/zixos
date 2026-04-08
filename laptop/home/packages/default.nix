{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./apps.nix
    ./browser.nix
    ./direnv.nix
    ./git.nix
    ./kitty.nix
    ./tmux.nix
    ./zed-editor.nix
    ./zsh.nix

    ./niri.nix
  ];
  home.packages = with pkgs; [
    devenv
  ];
}
