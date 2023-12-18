# global flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    unstable.url = "nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv/latest";
  };

  outputs = { self, nixpkgs, unstable, devenv, fenix }: {
    packages."aarch64-darwin".default = let
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      unstablePkgs = unstable.legacyPackages."aarch64-darwin";
      
    in pkgs.buildEnv {
      name = "home-packages";
      paths = with pkgs; [

        # general tools
        git
        curl
        wget
        jq
        tmux

        # dev tools
        devenv.packages.aarch64-darwin.devenv
        httpie

        # programming environments
        deno
        nodejs
        yarn
        
        # go
        go
        unstablePkgs.goreleaser
				ghq
				peco
				hub
      ];
    };
  };

}