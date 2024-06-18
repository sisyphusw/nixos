# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  self,
  pkgs,
  inputs,
  ...
}: {
  # mtr A Network Diagnostic Tool for Linux
  programs.mtr.enable = true;

  # GNU Privacy Guard
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # import preconfig package module
  imports = [
    ./hyprland.nix  # window manager
    ./distrobox.nix # distrobox
    ./openssh.nix   # ssh
    ./mihomo.nix    # problem with not set default value, cause null
    ./neovim.nix    # editor
    ./xremap.nix    # keyremap
    ./proxychains-ng.nix # proxy tool

    ./alacritty.nix
  ];

  #-------------------------------------------#
  #           config in dotfiles              #
  #-------------------------------------------#
  environment.systemPackages = with pkgs; [
    git              # version control
    fish             # shell
    bash             # bash
    htop             # process manager
    fzf              # fuzze finder
    zoxide           # enhance 'cd'
    unzip
    wget
    curl             # network tool
    stow             # dotfiles manager
    tmux             # shell session manager
    tldr             # simple document
    ntfs3g

    lazygit          # git tui
    yazi             # file browser tui

    #starship         # shell prompt

    kitty            # terminal emulator
    firefox          # web browser
    fastfetch        # monitor info
    
    killall          # process
    # mordern unix
    broot            # tree
    bat              # cat
    fd               # find
    #eza              # enhance 'ls'
    #thefuck          # collect cmd

    #wineWowPackages.stable
    #wine
    #wineWowPackages.waylandFull
    python312
    python312Packages.pip
    python312Packages.virtualenv

    # social medida
    # discord
    # qq
  ] ++ [
    #inputs.amber.packages.${pkgs.system}.default 
  ];
}
