{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./users.nix
      ./fonts.nix
      ./packages.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" ];
    cleanTmpDir = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      #grub.enable = true;
      #grub.version = 2;
      #grub.device = "/dev/nvme0n1p7";
      #grub.useOSProber = true;
    };
  };

  networking = {
    networkmanager.enable = true;
  };


  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };
  
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "21.05";
}
