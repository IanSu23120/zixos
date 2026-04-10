{
  description = "my nixos config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      sops-nix,
      disko,
      ...
    }@inputs:
    let
      username = "iansu";
    in
    {
      nixosConfigurations.zix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs username; };
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./laptop/device
          ./laptop/wm
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = ./laptop/home;
              extraSpecialArgs = {
                inherit inputs username;
              };
              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
              ];
            };
          }
        ];
      };
    };
}
