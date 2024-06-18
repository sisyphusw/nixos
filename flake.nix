{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";

    amber.url = "github:Ph0enixKM/Amber";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    disko,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  in {
    nixosConfigurations = {
      "pc" = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./host/pc/configuration.nix
          disko.nixosModules.disko
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager {
            #home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sisy = import ./host/pc/modules/home.nix;
          }
        ];
        specialArgs ={inherit system inputs;};
      };
    };

    homeConfigurations = {
      "sisy" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/sisy/home.nix];
        extraSpecialArgs = {inherit system inputs;};
      };
    };
  };

  nixConfig = {
    extra-trusted-users = ["sisy"];
    extra-trusted-substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store/"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"

      "https://nix-config.cachix.org"
      "https://nix-community.cachix.org"

      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-config.cachix.org-1:Vd6raEuldeIZpttVQfrUbLvXJHzzzkS0pezXCVVjDG4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
}
