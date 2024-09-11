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
 background_opacity 0.8
shell fish
";
};


}
