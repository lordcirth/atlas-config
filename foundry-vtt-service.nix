{ config, lib, pkgs, ... }:

with lib;

let
  foundrycfg = config.services.foundry-vtt;
  foundry-vtt = pkgs.callPackage ./foundry-vtt-headless.nix {};
in {

  options = {
		services.foundry-vtt = {
			enable = mkOption {
				type = types.bool;
				default = false;
			};
		};
	};

	config = mkIf foundrycfg.enable {
	  systemd.services.foundry-vtt = {
			enable = true;
			user = nobody;
			script = "${pkgs.nodejs}/bin/node ${pkgs.foundry-vtt}/resources/app/main.js --dataPath=/var/lib/foundry-vtt";
		};
	};
}
