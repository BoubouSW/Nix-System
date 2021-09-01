{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      nano
      neovim
      wget
      git
      pv
      nodejs
      brightnessctl
      system-config-printer
      ccid
      libimobiledevice
    ];
    variables.EDITOR = "nano";
  };

  services.usbmuxd.enable = true;

  services = {

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "fr";
      xkbOptions = "eurosigne:e";
      modules = [ pkgs.xorg.xf86videofbdev ];

      libinput.enable = true;

      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
    };

    # Enable ipfs
    ipfs.enable = false;

    # Optimize battery
    tlp.enable = true;

    # Enable bluetooth service
    blueman.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound.
  nixpkgs.config.pulseaudio = true;
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

}
