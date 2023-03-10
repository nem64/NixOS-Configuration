{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    htop
    papirus-icon-theme
    firefox
    thunderbird
    vscodium
    neofetch
    yt-dlp
    gnupg
    git
    mtr
    traceroute
    qemu
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    iconTheme.name = "Papirus";
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };    
  };
}