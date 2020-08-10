# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, options, pkgs, ... }:

let password = (import ./passwords.nix).password;
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
    ./home-manager.nix
    ./ipfs.nix
    ./transmission.nix
    ./foundry-vtt-service.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only

  networking.hostName = "atlas"; # Define your hostname.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;

  # Set your time zone.
  time.timeZone = "America/Eastern";

  environment.systemPackages = with pkgs; [
    dtrx
    file
    git
    home-manager
    htop
    mkpasswd
    mosh
    ncdu
    neovim
    nixfmt
    nmap
    tmux
    unzip
    vim
    wget
    (callPackage ./foundry-vtt-headless.nix { })
  ];
  services.foundry-vtt.enable = true;
  services.openssh.enable = true;
  services.i2p.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  users.mutableUsers = false;
  users.users.root.hashedPassword = password;
  users.users.lordcirth = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = password;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXm7oXqY1G8dBDqP7TziaXFyVwHJ5ivgwweGAWzaSDT lordcirth@nezha"
    ];
  };

  home-manager.useGlobalPkgs = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

