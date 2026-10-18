{pkgs, inputs, ...}:

{
    environment.systemPackages = with pkgs; [
        inputs.otter-launcher.packages.x86_64-linux.default
    ];
}
