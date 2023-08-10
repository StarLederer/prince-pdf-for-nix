{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/23.05";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = "15.1";
        src = import ./src.nix { inherit pkgs; inherit version; inherit system; };
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "prince";
          inherit version;
          inherit system;

          nativeBuildInputs = with pkgs; [
            autoPatchelfHook
          ];

          buildInputs = with pkgs; [
            fontconfig.lib
          ];

          inherit src;

          installPhase = ''
            ./install.sh $out
          '';
        };
      }
    );
}
