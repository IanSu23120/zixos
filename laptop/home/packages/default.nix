{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./apps.nix
    ./browser.nix
    ./direnv.nix
    ./git.nix
    ./kitty.nix
    ./quickshell.nix
    ./starship.nix
    ./tmux.nix
    ./vscode.nix
    ./zed-editor.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [

    rustdesk-flutter
    discord
    spotify
  ];
}
