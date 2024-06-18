{
  pkgs,
  lib,
  ...
}: {
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";

  #home-manager.users.sisy = import ./host/pc/modules/home.nix;

  home.username = "sisy";
  home.homeDirectory = "/home/sisy";

  # gtk
  gtk = {
    enable = true;
    # theme.package = pkgs.gruvbox-gtk-theme;
    # theme.name = "Gruvbox-Dark-B"; 

    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";

    # font.package = pkgs.noto-fonts-cjk-sans;
    # font.name = "Noto Sans CJK SC";
    # font.size = 16;
  };

  #home.packages = with pkgs; [ nwg-look ];

  # alacritty
  xdg.configFile."alacritty/themes" = {
    enable = true;
    source = pkgs.alacritty-theme; 
  };


  stylix = {
     enable = true;
     autoEnable = true;
  
     targets = {
       kde.enable = true;
       waybar.enable = false;
       alacritty.enable = false;
     };
   };
}
