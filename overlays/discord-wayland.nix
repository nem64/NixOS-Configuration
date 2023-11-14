final: prev: {
    discord = prev.discord.overrideAttrs (e: rec {
        desktopItem = e.desktopItem.override (d: {
            exec = "${d.exec} --enable-features=UseOzonePlatform --ozone-platform=wayland";
        });

        installPhase = builtins.replaceStrings [ "${e.desktopItem}" ] [ "${desktopItem}" ] e.installPhase;
    });

    discord-wayland = final.discord;
}