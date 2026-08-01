{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [
    hugo
    imagemagick
  ];

   languages.javascript={enable = true; bun.enable=true;};

  enterShell = ''
    hugo version 
    echo
  '';

  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';
}
