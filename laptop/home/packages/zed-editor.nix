{pkgs, ...}:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "toml"
      "dockerfile"
      "lua"
      "vue"
      "nix"
    ];
    userSettings = {
      theme = "One Dark";
    };
    extraPackages = with pkgs;[
      nixd
      lua-language-server
    ];
  };
}
