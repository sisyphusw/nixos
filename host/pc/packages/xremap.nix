{
  pkgs,
  system,
  inputs,
  ...
}: {
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["sisy"];
  users.groups.input.members = ["sisy"];

  imports = [
    inputs.xremap-flake.nixosModules.default
  ];
  environment.systemPackages = [
    inputs.xremap-flake.packages.${system}.xremap-wlroots
  ];

  services.xremap.enable = false;
  #services.xremap = {
  #  enable = true;
  # to disable warning - trace: warning: Consider using withWlroots as recommended by upstream
  #  withWlroots = true;
  #  serviceMode = "user";
  #  userName = "alice";
  #withHypr = true;
  #  config.keymap = [
  #    {
  #      name = "neovim";
  #      remap = {"CapsLock" = "Esc";}; # globally remap CapsLock to Esc
  #    }
  #  ];
  #};
  #  yamlConfig = ''
  #    modmap:
  #      - name: global
  #        remap:
  #          # neovim
  #         CapsLock: Esc
  #          # tmux
  #          Shift_R:
  #            held: [Shift_R]
  #            alone: [Ctrl_R, b]
  #            alone_timeout_millis: 1000
  #          Shift_L
  #            held: [Shift_L]
  #            alone: [Ctrl_L, b]
  #            alone_timeout_millis: 1000
  #        application:
  #          only: [kitty]
  #  '';
  #};
}
