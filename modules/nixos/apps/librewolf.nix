{pkgs, ...}:

{
    environment.systemPackages = [ pkgs.librewolf ];
    programs.librewolf = {
        enable = true;
        languagePacks = [ "ro" ];
        settings = {};
    };
}
