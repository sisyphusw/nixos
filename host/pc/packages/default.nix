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
    unzip
    wget
    curl             # network tool
    git              # version control
    bash             # bash

    stow             # dotfiles manager

    fish             # shell
    kitty            # terminal emulator
    starship         # shell prompt

    tmux             # shell session manager

    firefox          # web browser

    fzf              # fuzze finder
    lazygit          # git tui

    
    yazi             # tui file manager
    zoxide           # enhance 'cd'
    bat              # enhance 'cat'
    killall          # process
    fastfetch        # monitor info
    eza              # enhance 'ls'
    tldr             # simple document
    thefuck          # collect cmd

    #wineWowPackages.stable
    #wine
    #wineWowPackages.waylandFull

    # social medida
    # discord
    # qq
  ] ++ [
    inputs.amber.packages.${pkgs.system}.default 
  ];
}
