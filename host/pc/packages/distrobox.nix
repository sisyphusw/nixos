
{
  self,
  pkgs,
  inputs,
  ...
}: {
  virtualisation = { 
    containers = {
      enable = true;
      # has been renamed
      #cdi.dynamic.nvidia.enable = true;
    };

    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    distrobox

    podman
    podman-tui
    podman-compose
  ];
}
