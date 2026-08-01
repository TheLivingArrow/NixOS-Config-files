{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs [
      plymouth
  ];
  boot.plymouth.theme = "bgrt";
};
