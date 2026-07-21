{
    description = "my flake, it snows";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    };

    outputs = { self, nixpkgs,...}: {
        nixosConfigurations.elderhailstorm = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = [
                ./configuration.nix
            ];
        };
    };
}
