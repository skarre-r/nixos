{ inputs, ... }:

{
  # TODO
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.neovim.enable = false; # ???
}
