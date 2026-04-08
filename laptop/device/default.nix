{ ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./config.nix
    ./disko.nix
    ./driver.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./network.nix
    ./ram.nix
    ./sops.nix
    ./timezone.nix
    ./user.nix
  ];
}
