{ pkgs, ... }:

{
  home.username = "skai273";
  home.homeDirectory = "/home/skai273";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tree-sitter
  ];

  xdg.mime.enable = false;

  programs.home-manager.enable = true;
}
