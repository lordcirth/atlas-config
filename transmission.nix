{ config, lib, pkgs, ... }:
{
    services.transmission = {
      enable  = true;
    };
    users.users.lordcirth.extraGroups = [ "transmission" ];
}
