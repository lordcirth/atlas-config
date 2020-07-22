{ config, lib, pkgs, ... }:
{
    environment.systemPackages = [ pkgs.ipfs-migrator pkgs.ipfs-cluster ];
    services.ipfs = {
      enable  = true;
    };
}
