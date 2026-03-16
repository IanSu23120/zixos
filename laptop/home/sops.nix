# manage private key for user-system
# like ssh-keys
{
  inputs,
  username,
  config,
  ...
}:
let
  sshPath = "${config.home.homeDirectory}";
in{
  sops = {
    age.keyFile = "/etc/age-key.txt";
    defaultSopsFile = "${inputs.self}/secrets/laptop.yaml";
    secrets."github_private_key" = {
      path = "${sshPath}/.ssh/id_ed25519";
    };
  };
}
