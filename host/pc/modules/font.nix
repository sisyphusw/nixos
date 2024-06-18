{pkgs, ...}: {
  fonts.packages = with pkgs; [
    #noto-fonts
    noto-fonts-cjk-sans   # for web browser
    noto-fonts-cjk-serif  
    noto-fonts-color-emoji

    cascadia-code    # for coding
    #fira-code
    font-awesome

    (nerdfonts.override {
      fonts = [
        "Noto"
        "FiraCode"
        "JetBrainsMono"
        "Monaspace"
      ];
    })
  ];

  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <alias>
        <family>icon</family>
        <prefer>
          <family>Font Awesome 6 Free</family>
        </prefer>
      </alias>
    </fontconfig>
  '';
}
