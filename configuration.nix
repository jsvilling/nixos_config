{ config, pkgs, ... }:

{

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub.enable = true;
    grub.device = "nodev";
    grub.useOSProber = true;
    grub.efiSupport = true;
  };

  powerManagement.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
                "dotnet-sdk-wrapped-7.0.410"
                "dotnet-sdk-7.0.410"
              ];


  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_GB.UTF-8";

  services = {
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb.layout = "ch";
      xkb.variant = "de_nodeadkeys";
    };
  };

  console.keyMap = "sg";

  hardware = {
    enableRedistributableFirmware = true;
    firmware = [ pkgs.wireless-regdb ];
    pulseaudio.enable = false;
  };

  security.rtkit.enable = true;

  users.users = {
    joshua = {
      isNormalUser = true;
      description = "Joshua";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        firefox
        docker-compose
      ];
    };

    joshua-ipt = {
      isNormalUser = true;
      description = "Joshua ipt";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        docker-compose
      ];
    };
  };

  programs = {
    dconf.enable = true;
    ssh.startAgent = true;
    zsh.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  environment.systemPackages = with pkgs; [
    vim
    virt-manager
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
