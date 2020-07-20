{ stdenv, autoPatchelfHook, unzip, libX11, libXcomposite, glib, libXcursor, libXdamage, libXext, libXi, libXrender, libXtst, libxcb, nspr, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libXrandr, libXScrnSaver, alsaLib, at-spi2-core, cups, nss, ... }:

let
  zipfile = /nix/store/1jvm0siryg45p8vjdzs7vgzxls50jx31-foundryvtt-0.6.5.zip;
  #zipfile = /home/lordcirth/foundryvtt-0.6.5.zip;
in
  stdenv.mkDerivation rec {
    pname = "foundry-vtt";
    version = "0.6.5";
    src = zipfile;

    buildInputs = [ autoPatchelfHook unzip libX11 libXcomposite glib libXcursor libXdamage libXext libXrender libXi libXrender libXtst libxcb nspr dbus gdk-pixbuf gtk3 pango atk cairo expat libXrandr libXScrnSaver alsaLib at-spi2-core cups nss ];
    libPath = stdenv.lib.makeLibraryPath [stdenv.cc.cc];

    unpackPhase = ''
      unzip ${src} -d src
    '';

    installPhase = ''
      cp -r src $out
    '';
  }
