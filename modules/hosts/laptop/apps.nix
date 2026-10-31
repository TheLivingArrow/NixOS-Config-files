{ self, inputs, ... }:

{
   flake.nixosModules.laptop-cfg-apps = {...}:
   let
        modules = with self.nixosModules.apps; [
            otter-launcher
            wireshark
            tagstudio
            zen
            rustdesk    
        ];
   in
   {
        imports = modules;
   }; 
}

