{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
    
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
    services.xserver.displayManager.defaultSession = "plasmawayland";
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    xdg.portal = {
        enable = true;
    };
    programs.dconf.enable = true;

    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}
