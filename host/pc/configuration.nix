# Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix") # hardware-configuration include

    ./modules/disk-config.nix     # disk partion
    ./modules/stylix.nix
    #./modules/home.nix

    ./modules/nvidia.nix
    ./modules/nix.nix             # nix setting
    ./modules/font.nix

    ./packages # package config
  ];
  # nixpkgs
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # cpu
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # boot setup
  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  # bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
#efiInstallAsRemovable = true;
  };

  # kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # networking
  networking.hostName = "pc"; # Define your hostname.
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  environment.etc."hosts".enable = false;

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol  # gui tool
  ];

  # locale
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-gtk
      ];
    };
  };


 # timezone
  time.timeZone = "Asia/Shanghai";


# tty
 console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    # useXkbConfig = true; # use xkb.options in tty.
  };


  # users
  users.users."sisy" = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish; # default shell
    #ignoreShellProgramCheck = true;
  };
  programs.fish.enable = true; # set the user default shell to fish
  

  # security
  security.polkit.enable = true;


  system.stateVersion = "23.11"; # dot not change this
 }
