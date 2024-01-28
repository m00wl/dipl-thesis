{
  description = "m00wl's diploma thesis";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = [ "x86_64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          tex = pkgs.texlive.combine {
            inherit (pkgs.texlive)
              scheme-small latexmk tudscr newunicodechar csquotes biblatex
              biber;
          };
        in { devShells.default = pkgs.mkShell { packages = [ tex ]; }; };
    };

  nixConfig.bash-prompt-suffix = "dev: ";
}
