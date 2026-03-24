{...}:
{
  programs.kitty = {
    enable = true;

    environment = {
      TERM = "xterm-256color";
    };
    font = {
      name = "IosevkaTerm Nerd Font";
      size = 12.0;
    };
    settings = {
      enable_audio_bell = false;
      hide_window_decorations = true;
    };
  };
}
