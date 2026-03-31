{ ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-x";
    keyMode = "vi";
    escapeTime = 50;
    terminal = "screen-256color";
    mouse = true;
    extraConfig = ''
      set -g status-position top
    '';
  };
}
