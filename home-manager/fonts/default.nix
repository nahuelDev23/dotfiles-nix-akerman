{
pkgs,
...
}:{
fonts.fontconfig.enable=true;

home.packages = with pkgs; [
victor-mono

];
}
