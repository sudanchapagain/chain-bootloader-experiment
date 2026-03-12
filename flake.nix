{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default =
      let pkgs = import nixpkgs { system = "x86_64-linux"; };
      in pkgs.mkShell {
        packages = with pkgs; [
          qemu
          spike
          # pkgsCross.riscv64-embedded.buildPackages.gcc
          # pkgsCross.riscv64-embedded.buildPackages.binutils
          nasm
          nasmfmt
        ];
      };
  };
}
