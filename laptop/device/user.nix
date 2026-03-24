{
  config,
  pkgs,
  username,
  ...
}: {
  networking.hostName = "zix";
  users.mutableUsers = false;
  users.users."root" = {
    hashedPasswordFile = config.sops.secrets.root_password.path;
  };
  users.users.${username} = {
    hashedPasswordFile = config.sops.secrets.user_password.path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBo0WRl1dRxICrR+Nk9JkH7SZReTbI5k2q2FjqwkW+RX 4B1L0901@stust.edu.tw"
    ];
    shell = pkgs.bash;
    isNormalUser = true;
    description = "IanSu";
    extraGroups = ["networkmanager" "wheel" "video"];
  };
  programs.bash = {
    enable = true;
    enableCompletion = true;
    blesh.enable = true;
  };

}
