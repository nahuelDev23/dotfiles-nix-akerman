# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
     
  # Bootloader.
   boot.loader.systemd-boot.enable=true;
   boot.loader.efi.canTouchEfiVariables=true;
  networking.hostName = "akerman"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
#docker
virtualisation.docker.enable = true;
virtualisation.docker.rootless = {
  enable = true;
  setSocketVariable = true;
};
  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.akerman = {
    isNormalUser = true;
    description = "akerman";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  xdg-utils
  gcc
  cargo
  prettierd
  typescript 
  eslint_d
  ];
virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "akerman" ];
   virtualisation.virtualbox.host.enableExtensionPack = true;
    virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
    hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  programs.hyprland ={
      enable=true;
     xwayland.enable = true;
    };

     programs.steam = {
  enable = true;
  localNetworkGameTransfers.openFirewall = true; 
};
nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List services that you want to enable:

services.devmon.enable = true;
services.gvfs.enable = true; 
services.udisks2.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.xserver.enable=true;
  services.xserver.displayManager.gdm.enable = true;
  #services.xserver.displayManager.gdm.wayland = false;
  services.xserver.desktopManager.gnome.enable = false;
  services.xserver.displayManager.lightdm.enable = false;  # Activa SDDM
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22];
  networking.firewall.allowedUDPPorts = [ 22];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  #sound.enable=true;
  services.pipewire ={
  enable=true;
  alsa.enable=true;
  alsa.support32Bit = true;
  pulse.enable=true;
  jack.enable=true;
};


  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  #impresoras
  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
