{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.neovim-nightly-overlay.overlay];

  environment.variables.EDITOR = "nvim";

  environment.systemPackages = with pkgs; [
    neovim-nightly
    # lsp denpendency
    lua-language-server     # lua lsp
    stylua                  # lua formater
    selene                  # lua linter

    nil                     # nix lsp
    alejandra               # nix formater
  ];
}
