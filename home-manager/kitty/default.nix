{
lib,
...
}:{
programs.kitty = {
 enable = true;
  shellIntegration.enableFishIntegration = true;
font = {
 name= "Victor Mono DemiBold";
 size=18;
};
extraConfig ="
 background_opacity 0.8
";
};


}
