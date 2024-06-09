{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  home.username = "sisy";
  home.homeDirectory = "/home/sisy";


  # gtk
   gtk = {
    enable = true;
    theme.name = "Gruvbox-Dark-B"; 
    theme.package = pkgs.gruvbox-gtk-theme;
    font.size = 14;
    font.name = "Noto Sans CJK SC";
  };

  # alacritty
  xdg.configFile."alacritty/themes".source = pkgs.alacritty-theme;
}
