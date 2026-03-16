# manage system root and user password
{
  inputs,
  username,
  ...
}: {
  sops.defaultSopsFile = "${inputs.self}/secrets/laptop.yaml";
  sops.age.keyFile = "/etc/age-key.txt";
  sops.age.generateKey = false;

  sops.secrets."root_password" = {
    neededForUsers = true;
  };
  sops.secrets."user_password" = {
    neededForUsers = true;
  };

}
