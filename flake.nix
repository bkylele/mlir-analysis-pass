{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      eachSystem = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      pkgsFor = system: import nixpkgs { inherit system; };
    in
    {
      devShells = eachSystem (system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              llvmPackages_23.llvm
              llvmPackages_23.mlir
              llvmPackages_23.clang
              llvmPackages_23.clang-tools
              cmake
              bear
            ];

            # Nix puts MLIR's binaries and CMake package files in separate
            # outputs.  Point CMake at the development output explicitly;
            # llvm-config only knows about LLVM's own CMake directory.
            MLIR_DIR = "${pkgs.llvmPackages_23.mlir.dev}/lib/cmake/mlir";
          };
        }
      );
    };
}
