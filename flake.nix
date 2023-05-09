{
  description = "hyprland-autoname-workspaces flake";

  inputs = {
    nixpkgs.url = "nixpkgs"; # We want to use packages from the binary cache
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachSystem [ "x86_64-linux" ] (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {
    packages.hyprland-autoname-workspaces = pkgs.callPackage ./default.nix { };

    legacyPackages = packages;

    defaultPackage = packages.hyprland-autoname-workspaces;

    devShell = pkgs.mkShell {
      CARGO_INSTALL_ROOT = "${toString ./.}/.cargo";

      buildInputs = with pkgs; [ cargo rustc git ];
    };

  });
}