{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.rustdesk.RustDesk"
      "com.discordapp.Discord"
      "com.spotify.Client"
    ];
  };
}
