{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nix user repository
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        "thinkpad" =
          let
            system = "x86_64-linux";
            specialArgs = { inherit inputs system; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = [
              {
                # TODO: move this somewhere else?
                nixpkgs.overlays = [
                  inputs.nur.overlays.default # TODO does this work?
                  (final: prev: {
                    unstable = import nixpkgs-unstable {
                      inherit (final) config;
                      inherit (final.stdenv.hostPlatform) system;
                    };
                  })
                ];
              }
              ./configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.skar = import ./home.nix;
                home-manager.backupFileExtension = "backup";
                home-manager.extraSpecialArgs = specialArgs;
              }
            ];
          };
      };

    };
}
