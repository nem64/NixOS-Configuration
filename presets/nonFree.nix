{nixpkgs, lib, ...}:

{
    nixpkgs = {
        config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
            "steam"
            "steam-original"
            "steam-run"

            "telegram-desktop"
            "discord"
            "winbox"
            "vscode"
        ];

        overlays = [
            (import ../overlays/discord-wayland.nix)
        ];
    }; 
}