{nixpkgs, inputs, SYSTEM, ...}:

{
  environment.systemPackages = with inputs; [
    tagstudio.packages.${SYSTEM}.tagstudio
  ];   
}
