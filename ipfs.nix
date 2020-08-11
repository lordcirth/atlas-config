{ config, lib, pkgs, ... }: {
  environment.systemPackages = [ pkgs.ipfs-migrator pkgs.ipfs-cluster ];
  networking.firewall.allowedTCPPorts = [ 4001 ];
  networking.firewall.allowedUDPPorts = [ 4001 ];
  services.ipfs = { enable = true; };

}
