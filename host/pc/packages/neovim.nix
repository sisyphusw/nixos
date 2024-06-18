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

    pyright
    ruff

    nil                     # nix lsp
    alejandra               # nix formater

    #nodePackages_latest.vscode-json-languageserver #json
    nodePackages_latest.vscode-json-languageserver-bin#json
  ];
}
