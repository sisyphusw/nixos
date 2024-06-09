{
  pkgs,
  ...
}: {
    environment.systemPackages = [pkgs.openssh];

    services.openssh = {
        enable = true;
    };
}
