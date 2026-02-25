{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:
    {
      nixosConfigurations.default = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # "pkgs.unstable" overlay
          {
            nixpkgs.overlays = [
              (final: prev: {
                unstable = import nixpkgs-unstable {
                  inherit (final) config;
                  inherit (final.stdenv.hostPlatform) system;
                };
              })
            ];
          }

          # config
          ./configuration.nix

          # home-manager
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.skar = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
