{pkgs, ...}: {
  # window manager - hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # xdg portal
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };

  # display manager - sddm > wayland
  services.displayManager.sddm = {
    enable = true;
    theme = "chili";
    wayland.enable = true;
    package = pkgs.sddm;
  };

  environment.sessionVariables = {

    WLR_NO_HARDWARE_CURSORS = "1";

    # electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";


    XDG_SESSION_TYPE = "wayland";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";

    CLIPBOARD_NOGUI="1";
    CLIPBOARD_THEME="ansi";
    CLIPBOARD_NOAUDIO="1";
    #CLIPBOARD_NOPROGRESS="1";
  };

  # dependency packages
  environment.systemPackages = with pkgs; [
    wayland
    sddm-chili-theme

    # VA-API
    libva-utils

    # not sure
    gsettings-desktop-schemas
    hyprland-protocols

    # status bar
    waybar

    # clipboard manager
    wl-clipboard
    clipboard-jh

    # screenshot
    grim
    slurp

    # hyprland plugins
    pyprland

    # wallpaper
    hyprpaper

    # color picker
    hyprpicker

    # file browser
    dolphin


    # Must Have - https://wiki.hyprland.org/Useful-Utilities/Must-have/

    # A notification daemon
    dunst

    # Pipewire

    # XDG Desktop Portal
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Authentication Agent
    polkit-kde-agent

    # Qt Wayland Support
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ];

  # must have
  security.polkit.enable = true;

  #services.xserver.desktopManager.runXdgAutostartIfNone

  #xdg.configFile."hypr/hyprland.conf".enable = lib.mkForce false;
  #home.file.".config/hypr/hyprland.conf".enable = lib.mkForce false;
}
