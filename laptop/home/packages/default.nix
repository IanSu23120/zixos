{pkgs, ...}:
{
  imports = [
    ./apps.nix
    ./browser.nix
    ./direnv.nix
    ./git.nix
    ./kitty.nix
    ./zed-editor.nix
  ];
  home.packages = with pkgs; [
    devenv
  ];
}
