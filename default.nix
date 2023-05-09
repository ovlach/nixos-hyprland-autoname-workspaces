{ pkgs ? import <nixpkgs> { }
, stdenv ? pkgs.stdenv
, lib ? stdenv.lib
, rustPlatform ? pkgs.rustPlatform
, fetchFromGitHub ? pkgs.fetchFromGitHub
}:
rustPlatform.buildRustPackage rec {
  pname = "hyprland-autoname-workspaces";
  version = "0.4.4";

  src = fetchFromGitHub {
      owner = "hyprland-community";
      repo = "hyprland-autoname-workspaces";
      rev = "${version}";
      sha256 = "sha256-X2RY0TkfumfTk/f0E7RnDhUkJGAkDKHd6+cy+XUyCwA=";
    };

  cargoSha256 = "sha256-Bf1GoQh6rnQoNX2I2lZvUpOXRDqgUvoeguqI1TMy2nk=";

  # Tests is nondeterministic
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/hyprland-community/hyprland-autoname-workspaces/";
    description = "hyprland autoname workspaces";
    license = licenses.isc;
  };
}