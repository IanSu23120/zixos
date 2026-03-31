{ ... }:
{
  zramSwap.enable = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8192; # 8GB
    }
  ];
}
