{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alacritty
    alacritty-theme
    ueberzugpp # draw images 
  ];
  
  # setup in home-manager
  #xdg.configFile."alacritty/themes".source = pkgs.alacritty-theme;
}
