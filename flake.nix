{
  description = "My nix config fragments";

  nixConfig = {
    extra-experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    } @ inputs:
    let
      inherit (self) outputs;
  
      home-common =
        {
          lib,
          system,
          pkgs,
          ...
        }:
        {
          nixpkgs = {
            config = {
              allowUnfree = true;
            };
          };
          programs.home-manager.enable = true;
          home.stateVersion = "22.05";

          imports = [ ./home-manager ];
        };

      ubuntu-vm = 
        { pkgs, ... }:
        {
          home.username = "smaritsas";
          home.homeDirectory = "/home/smaritsas";
          home.packages = with pkgs; [
            openssh
            docker
          ];
        };
    in
    {
    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#smaritsas@ubuntu-vm'
      homeConfigurations = {
        "smaritsas@ubuntu-vm" =
          home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {
              inherit inputs outputs;
            };
            modules = [
              home-common
            ];
          };
      };
    };
}
