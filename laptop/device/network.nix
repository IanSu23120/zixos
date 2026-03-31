{ ... }:
{
  networking = {
    networkmanager.enable = true;
    networkmanager.insertNameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    useDHCP = false;

    firewall.allowedTCPPorts = [
      21118
      21119
    ];
    firewall.allowedUDPPorts = [ 21116 ];
  };
  programs.nm-applet.enable = true;
}
