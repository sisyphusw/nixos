
{
  pkgs,
  ...
}: {
    environment.systemPackages = [pkgs.mihomo];
   services.mihomo = {
     enable = true;
     configFile = "/home/sisy/.config/mihomo/config.yaml";
     #package = pkgs.mihomo;
   };
}
