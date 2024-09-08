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

];
  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
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
      modules-left = [ "network" ];
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
      margin:1rem;
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
  '';
};  
   # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "nahuelDev23";
    userEmail = "nahuel.dev.23@gmail.com";
  };
  wayland.windowManager.hyprland= {
       enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

settings = {
decoration = {
        rounding = 0;
        drop_shadow = true;
        shadow_range = 30;
        shadow_render_power = 3;

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
        };
      };
 bind = [
   "SUPER,Q,killactive"
   "SUPER,D,exec,wofi --show drun"
   "SUPER,Return,exec,kitty"

   #window
   "SUPER SHIFT,Right, movewindow , r"
   "SUPER SHIFT,Left, movewindow , l"
   "SUPER ,Left, movefocus , l" #move window to left
   "SUPER ,Right, movefocus , r" #move window to right
   "SUPER ,Down, movefocus , d" #move window to bottom
   "SUPER ,Up, movefocus , u" #move window to top
   "SUPER ,1,workspace,1" # go to workspace 1
   "SUPER ,2,workspace,2" # go to workspace 2
   "SUPER ,3,workspace,3" # go to workspace 2
   "SUPER ,4,workspace,4" # go to workspace 2
   "SUPER ,5,workspace,5" # go to workspace 2
   "SUPER SHIFT,1,movetoworkspace,1" # go current window to workspace 1
   "SUPER SHIFT,2,movetoworkspace,2" # go currnte window to workspace 2
   ## 3 al 5 no andan
   "SUPER SHIFT,3,movetoworkspace,3" # go currnte window to workspace 2
   "SUPER SHIFT,4,movetoworkspace,4" # go currnte window to workspace 2
   "SUPER SHIFT,5,movetoworkspace,5" # go currnte window to workspace 2

 
];

exec-once= [
"swww-daemon"
"swww img /home/akerman/.dotfiles/dotfiles-nix-akerman/wallpaper.png"
"sleep 1 waybar"
];

};
   };
 




   home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
