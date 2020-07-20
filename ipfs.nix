{ config, lib, pkgs, ... }:
let master = import (
  fetchGit {
    name = "nixos-master";
    url = "https://github.com/NixOS/nixpkgs.git";
  }
) {};
in
{
    environment.systemPackages = [ master.ipfs master.ipfs-migrator];
    services.ipfs = {
      enable          = true;
    };
}
