{ stdenv, requireFile, autoPatchelfHook, unzip, libX11, libXcomposite, glib
, libXcursor, libXdamage, libXext, libXi, libXrender, libXtst, libxcb, nspr
, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libXrandr, libXScrnSaver
, alsaLib, at-spi2-core, cups, nss, ... }:

let
  zipfile = requireFile {
    name = "foundry-vtt-nodejs-0.6.5.zip";
    sha256 = "a78d07ca9b72ae74acf2d91d55edce8f4b857839b0b1b16e28c223c70eaaa362";
    url = "";
  };

in stdenv.mkDerivation rec {
  pname = "foundry-vtt";
  version = "0.6.5";
  src = zipfile;

  buildInputs = [
    alsaLib
    at-spi2-core
    atk
    autoPatchelfHook
    cairo
    cups
    dbus
    expat
    gdk-pixbuf
    glib
    gtk3
    libX11
    libXScrnSaver
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXi
    libXrandr
    libXrender
    libXrender
    libXtst
    libxcb
    nspr
    nss
    pango
    unzip
  ];

  unpackPhase = ''
    unzip ${src} -d src
  '';

  installPhase = ''
    cp -r src $out
  '';
}
