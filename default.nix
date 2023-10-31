{ pkgs ? import <nixpkgs> { }
, stdenv ? pkgs.stdenv
, lib ? stdenv.lib
, rustPlatform ? pkgs.rustPlatform
, fetchFromGitHub ? pkgs.fetchFromGitHub
}:
rustPlatform.buildRustPackage rec {
  pname = "hyprland-autoname-workspaces";
  version = "1.1.11";

  src = fetchFromGitHub {
      owner = "hyprland-community";
      repo = "hyprland-autoname-workspaces";
      rev = "${version}";
      sha256 = "x9MXp2MZtrnVI3W+6xo34uUHuRnpVeXS+3vbyti1p24=";
    };

  cargoSha256 = "sha256-mSUtFZvq5+rumefJ6I9C6YzRzu64oJ/bTwaa+rrFlL4=";

  # Tests is nondeterministic
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/hyprland-community/hyprland-autoname-workspaces/";
    description = "hyprland autoname workspaces";
    license = licenses.isc;
  };
}
