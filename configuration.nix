{ config, pkgs, ... }:

{
    imports =
    [
        ./hardware-configuration.nix

        ./presets/nonFree.nix
        ./presets/fonts.nix
        ./presets/plasma.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

    time.timeZone = "Asia/Baghdad";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.nemesis = {
        isNormalUser = true;
        description = "Abbas";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    networking.firewall.enable = false;
    nix.settings.experimental-features = "nix-command flakes";
    system.stateVersion = "23.05";

}
