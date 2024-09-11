{
  pkgs,
  ...
}: {

  # Incluir el paquete de Iosevka Nerd Font
  home.packages = with pkgs; [
    nerd-fonts-iosevka
  ];

  # Configurar las fuentes para Iosevka Nerd Font
  fonts = {
    enable = true;

    # Definir las fuentes adicionales
    fontDirs = [
      "${pkgs.nerd-fonts-iosevka}/share/fonts"
    ];

    # Especificar las fuentes preferidas para monospace y nerd fonts
    fontconfig = {
      settings = {
        "monospace" = [ "Iosevka Nerd Font" ];
      };
    };
  };
}

