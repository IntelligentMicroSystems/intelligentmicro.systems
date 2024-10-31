{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  mainroad = pkgs.fetchFromGitHub {
    owner = "vimux";
    repo = "mainroad";
    rev = "13e04b3694ea2d20a68cfbfaea42a8c565079809";
    sha256 = "sha256-td8xQhAz/TnjZmOKIEiQjRgzdoicRrVN9h41Uxnnaso=";
  };
in
mkShell {
  packages = [
    hugo
    nodejs_18
    go
  ];

  buildInputs = [
    hugo
  ];

  nativeBuildInputs = with pkgs; [ ];

  shellHook = ''
    if [[ ! -d themes ]]; then
      mkdir -p themes
    fi

    if [[ ! -s themes/mainroad ]]; then
      ln -snf "${mainroad}" themes/mainroad
    fi
  '';
}
