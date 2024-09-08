{config,pkgs,...}:{
 # please change the username & home directory to your own
  home.username = "akerman";
  home.homeDirectory = "/home/akerman";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';
  imports = [
   ./home-manager/kitty
   ./home-manager/fonts
   ./home-manager/hypr

];
  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
docker 
docker-compose
networkmanagerapplet
firefox
vim
    nitch

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    
    # productivity
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
swww
  ];

programs.wofi = {
 enable=true;
settings ={
  width=700;
};
style = "
#window{
 background:rgba(0,0,0,1);
 border-radius:10px;
}
#text {
color:white;
}
#outer-box {
padding:1rem;
}
#input {
 background:rgba(0,0,0,1);
 border-radius:4px;
  border:1px solid white;
margin-bottom:1rem;
}

#entry:selected{
padding:1rem;
border-radius:4px;
background: linear-gradient(to right, #6B2A71, #E91E63);
}

";
};

programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [ "DP-2" ];
      modules-left = [ "clock" ];
      modules-center = [ "hyprland/workspaces" ]; # Aquí agregamos los workspaces centrados
      modules-right = [ "temperature" ];

      "hyprland/workspaces" = {
        format = "{icon}";  # Formato de icono
        on-click = "activate";  # Acción al hacer clic en un workspace
        format-icons = {
          "1" = "●";  # Íconos circulares para los workspaces
          "2" = "●";
          "3" = "●";
          "4" = "●";
          "5" = "●";
          "urgent" = "";  # Icono para workspaces urgentes
          "active" = "●";  # Icono para el workspace activo
          "default" = "○";  # Icono predeterminado para otros workspaces
        };
        sort-by-number = true;  # Ordenar por número
        persistent-workspaces = {
          "1" = [];  # Siempre mostrar workspace 1
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
        };
      };

"clock" = {
  interval = 60;
  format = "{:%d %b %H:%M}";  # Muestra el día y el mes en forma corta
  locale = "es_AR.UTF-8";
  tooltip = true;
  tooltip-format = "{:%Y-%m-%d}";  # Muestra la fecha completa en el tooltip
};
};
};

  style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: Source Code Pro;
    }

    window#waybar { 

background:transparent;
    }
#workspaces {
      margin-top:.4rem;
      margin-bottom:.4rem;

      border-radius:4px;
      background: #6B2A71; /* violeta goku black*/
}
    #workspaces button {
      margin-right:1rem; 
      color: #AAB2BF;
      border-radius: 50%;  
    } 
#workspaces button:last-child {
      margin-right:0px; 
    }

    #workspaces button.active {
      color: #E91E63; /* rosa goku black*/
    }
    #workspaces button:hover {
background:none;
box-shadow:none;
    }

#clock {
 padding:.5rem;
 margin-left:1rem;
 
      margin-top:.4rem;
      margin-bottom:.4rem;
 color:white;
 border-radius:4px;
 background: #6B2A71; /* violeta goku black*/
}
  '';
};  
   # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "nahuelDev23";
    userEmail = "nahuel.dev.23@gmail.com";
  };
 

programs.fish={
enable=true;
};

programs.zoxide={
enable=true;
};
 

   home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
