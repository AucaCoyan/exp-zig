{
  description = "Zig dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zig-overlay.url = "github:mitchellh/zig-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      zig-overlay,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Pin to master — reproducibility comes from committing flake.lock.
        # If you need a specific nightly by date, use: zig-overlay.packages.${system}."master-2025-03-15"
        zig = zig-overlay.packages.${system}.master;
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ zig ];

          shellHook = ''
            echo "Zig $(zig version)"
          '';
        };

        packages.default = zig;
      }
    );
}
