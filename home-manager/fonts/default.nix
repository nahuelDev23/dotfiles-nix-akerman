{
pkgs,
...
}:{
fonts.fontconfig.enable=true;

home.packages = with pkgs; [
pkgs.iosevka
(pkgs.nerdfonts.override {
      fonts = [
        "IBMPlexMono"
        "Iosevka"
        "IosevkaTerm"
      ];
    })
];
}
