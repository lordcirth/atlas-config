{ stdenv, unzip }:
let
  zipfile = /nix/store/1jvm0siryg45p8vjdzs7vgzxls50jx31-foundryvtt-0.6.5.zip;
  #zipfile = /home/lordcirth/foundryvtt-0.6.5.zip;
in {
  foundry-vtt = stdenv.mkDerivation rec {
    pname = "foundry-vtt";
    version = "0.6.5";
    src = zipfile;

    buildInputs = [unzip];

    unpackPhase = ''
      unzip ${src}
    '';
  };
}
