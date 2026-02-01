{ config, pkgs, ... }:

{

  imports = [
    ./audio.nix
    ./fonts.nix
    ./nvidia.nix
  ];

}
