{
lib,
...
}:{
programs.kitty = {
 enable = true;
  shellIntegration.enableFishIntegration = true;
font = {
 name= "IosevkaTerm Nerd Font";
 size=16;
};
extraConfig ="
background #1F1F2F
 background_opacity .7
shell fish
";
};


}
