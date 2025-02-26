{ stdenv, cmake }:

stdenv.mkDerivation rec {
    pname = "HyTech_Lab2_P3_Library";
    version = "0.1.0";
    src = ./hellolib;
    nativeBuildInputs = [ cmake ];
}