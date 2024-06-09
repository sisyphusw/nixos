{
  config,
  pkgs,
  ...
}: {
  boot.initrd.kernelModules = ["nvidia"];
  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];

  #  OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      libvdpau-va-gl
      vaapiVdpau
    ];
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
