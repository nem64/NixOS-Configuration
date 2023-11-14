{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        steam
        discord-wayland
        telegram-desktop

        htop
        papirus-icon-theme
        firefox
        thunderbird
        vscode
        neofetch
        yt-dlp
        git
        mtr
        traceroute
        winbox
    ];

    programs = {
        direnv = {
        enable = true;
        enableBashIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
        };

        bash.enable = true; # see note on other shells below
    };
    
    home.stateVersion = "23.05";
}