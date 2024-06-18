{
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;

    image = /home/sisy/Pictures/wallpapers/wallhaven-l8vp7y_1920x1080.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

    fonts = {
      sizes = { 
        applications = 16;
        desktop = 14;
        popups = 14;
        terminal = 16;
      };

      serif.package = pkgs.noto-fonts-cjk-serif;
      serif.name = "Noto Serif CJK SC";

      sansSerif.package = pkgs.noto-fonts-cjk-sans;
      sansSerif.name = "Noto Sans CJK SC";
      
      monospace.package = pkgs.noto-fonts;
      monospace.name = "Noto Sans Mono CJK SC";

      emoji.package = pkgs.noto-fonts-emoji;
      emoji.name = "Noto Color Emoji";
    };

    targets = {
      fish.enable = false;
    };
  };
}
