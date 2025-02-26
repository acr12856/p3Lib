{
  description = "Lab 2 Part 3 LibFlake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ...} @inputs:
    let 
      system = "aarch64-darwin";
      overlay = final: prev: {
        hellolib = final.callPackage ./hellolib.nix {};
      };
    overlays = [overlay];

    pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [ self.overlays.default ];
      };
    in
    {
      packages.${system}.default = pkgs.hellolib;
      overlays.default = nixpkgs.lib.composeManyExtensions overlays;
    };
}
