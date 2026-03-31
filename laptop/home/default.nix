{
  pkgs,
  lib,
  inputs,
  username,
  ...
}:
{
  imports = [
    ./packages
    ./config

    ./fcitx5.nix
    ./sops.nix
    # "${inputs.emacs-config}/emacs.nix"
    # "${inputs.nvim-config}/nvim.nix"
  ];

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.pointerCursor = {
    enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  xdg.userDirs = {
    enable = true;
    setSessionVariables = true;
    createDirectories = false;
    desktop = null;
    documents = null;
    music = null;
    pictures = null;
    publicShare = null;
    templates = null;
    videos = null;
  };
}
