{ stdenv, autoPatchelfHook, unzip, libX11, libXcomposite, glib, libXcursor, libXdamage, libXext, libXi, libXrender,
  libXtst, libxcb, nspr, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libXrandr, libXScrnSaver, alsaLib,
  at-spi2-core, cups, nss, ... }:

let
  zipfile = /nix/store/bk2c7x2n3q33f3vv2vmfy268h0i0plzp-foundryvtt-nodejs-0.6.5.zip;
in
  stdenv.mkDerivation rec {
    pname = "foundry-vtt";
    version = "0.6.5";
    src = zipfile;

    buildInputs = [ autoPatchelfHook unzip libX11 libXcomposite glib libXcursor libXdamage libXext libXrender libXi
      libXrender libXtst libxcb nspr dbus gdk-pixbuf gtk3 pango atk cairo expat libXrandr libXScrnSaver alsaLib
      at-spi2-core cups nss ];

    unpackPhase = ''
      unzip ${src} -d src
    '';

    installPhase = ''
      cp -r src $out
    '';
  }
