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
    #- Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    WLR_NO_HARDWARE_CURSORS = "1";

    GBM_BACKEND = "nvidia-drm";
    CLUTTER_BACKEND = "wayland";
    # VA-API hardware video acceleration
    NVD_BACKEND = "direct";

    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # hardware acceleration
    LIBVA_DRIVER_NAME = "nvidia";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  # dependency packages
  environment.systemPackages = with pkgs; [
    wayland
    sddm-chili-theme

    # xdg
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # qt
    libsForQt5.qt5.qtwayland
    qt6.qtwayland

    # VA-API
    libva-utils

    # not sure
    gsettings-desktop-schemas
    hyprland-protocols

    # clipboard manager
    wl-clipboard
    cliphist

    # screenshot
    grim
    slurp

    # notification
    dunst
    
    #mako
    # hyprland plugins
    pyprland
  ];

  # must have
  security.polkit.enable = true;

  #xdg.configFile."hypr/hyprland.conf".enable = lib.mkForce false;
  #home.file.".config/hypr/hyprland.conf".enable = lib.mkForce false;
}
