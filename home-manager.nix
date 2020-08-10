{ config, lib, pkgs, ... }:

let
  cfg = {

    programs.neovim = {
      enable = true;
      viAlias = true;
      extraConfig = ''
        set noexpandtab
        set tabstop=2
        set shiftwidth=2
      '';
    };
  };
in {
  imports = [ <home-manager/nixos> ];
  home-manager.users = { lordcirth = cfg; };
}

