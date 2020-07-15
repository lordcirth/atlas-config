

self: super:
let
  zip = "/nix/store/1jvm0siryg45p8vjdzs7vgzxls50jx31-foundryvtt-0.6.5.zip";
in {
  foundry-vtt = super.stdenv.mkDerivation rec {
    pname = "foundry-vtt";
    version = "0.6.5";
    src = zip;
  };
}
