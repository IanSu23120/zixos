{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./apps.nix
    ./browser.nix
    ./direnv.nix
    ./git.nix
    ./kitty.nix
    ./starship.nix
    ./tmux.nix
    ./zed-editor.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    devenv
  ];
}
