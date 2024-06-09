{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alacritty
    alacritty-theme
  ];
  
  # setup in home-manager
  #xdg.configFile."alacritty/themes".source = pkgs.alacritty-theme;
}
