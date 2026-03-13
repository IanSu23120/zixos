{pkgs, ...}:
{
  imports = [
    ./git.nix
    ./kitty.nix
  ];
  home.packages = with pkgs; [
    nixd
    alejandra
    lua-language-server
    stylua
  ];

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}
