{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "None";
        opacity = 0.9;
      };
      font = {
        normal = {
          family = "IosevkaTerm Nerd Font Mono";
        };
        size = 12.0;
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "Never";
        };
      };

    };
    theme = "tokyo_night_storm";
  };
}
