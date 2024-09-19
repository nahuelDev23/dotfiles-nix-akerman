{
lib,
...
}:{
programs.kitty = {
 enable = true;
  shellIntegration.enableFishIntegration = true;
font = {
 name= "Iosevka";
 size=14;
};
extraConfig ="
background #1F1F2F
 background_opacity .7
shell fish
";
};


}
