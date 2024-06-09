{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [proxychains-ng];

  environment.variables = {
    # for proxychain4 to look up config file path
    PROXYCHAINS_CONF_FILE = "${config.users.users.sisy.home}/.config/proxychains/proxychains.conf";
  };
}
