{ pkgs, ... }:
{
  programs.niri = {
    package = pkgs.niri-unstable;
    settings = {
      binds = {
        "Mod+T".action.spawn = "alacritty";
        "Mod+A".action.spawn-sh = "rofi -modi drun,run -show drun";
        "Mod+Q" = {
          action.close-window = [ ];
          repeat = false;
        };
        "Mod+H".action.focus-column-left = [ ];
        "Mod+J".action.focus-window-down = [ ];
        "Mod+K".action.focus-window-up = [ ];
        "Mod+L".action.focus-column-right = [ ];
      };

    };
  };
}
