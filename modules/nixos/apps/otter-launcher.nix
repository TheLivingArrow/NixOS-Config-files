{pkgs, inputs, ...}:

{
    environment.systemPackages = with pkgs; [
        inputs.otter-launcher.packages.default
    ];
}
