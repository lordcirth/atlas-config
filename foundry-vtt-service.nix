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
			wantedBy = [ "multi-user.target" ];
			serviceConfig = {
				DynamicUser = true;
				StateDirectory = "foundry-vtt";
			};
			script = "${pkgs.nodejs}/bin/node ${foundry-vtt}/resources/app/main.js --dataPath=/var/lib/foundry-vtt";
		};
	};
}
