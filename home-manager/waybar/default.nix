{pkgs,config,...}:

let
primary_color = "#F1E4CD";
secondary_color = "#1F1F2F";
border_radius = "7px";
border_size = "2px";
in
{

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [ "DVI-I-1" "DP-2" ];
        modules-left = [ "clock" "custom/cava"];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = ["pulseaudio" "pulseaudio/slider"];
     "pulseaudio" = {
        format = " {icon}";
        "format-bluetooth" = "{volume}% ";  # <U+F294>
        "format-muted" = "";               # <U+F026>
        "format-icons" = {
          "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";  # <U+E32D>
          "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";  # <U+EEE8><U+E32D>
          "headphones" = "";               # <U+F025>
          "handsfree" = "";               # <U+F590>
          "headset" = "";                 # <U+F590>
          "phone" = "";                   # <U+F095>
          "phone-muted" = "";             # <U+ED17>
          "portable" = "";                # <U+F095>
          "car" = "";                     # <U+F1B9>
          #"default" = ["" ""];           # <U+F027>, <U+F028>
           "default" = ["" ""];  # <U+F027>, <U+F028>
        };
     };
      "pulseaudio/slider"= {
      "min"= 0;
      "max"= 100;
      "orientation"= "horizontal";
    };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "●";
            "2" = "●";
            "3" = "●";
            "4" = "●";
            "5" = "●";
            "urgent" = "";
            "active" = "●";
            "default" = "○";
          };
          sort-by-number = true;
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        "clock" = {
          interval = 60;
          format = "{:%d %b %H:%M}";
          locale = "es_AR.UTF-8";
          tooltip = true;
          tooltip-format = "{:%Y-%m-%d}";
          timezone= "America/Argentina/Buenos_Aires";
        };


"custom/cava"= {
    "exec"= "bash ~/.dotfiles/dotfiles-nix-akerman/home-manager/waybar/cava.sh";
    "format"="{}";
};


      };
    };

    style = ''

      * {
        border: none;
        border-radius: 0;
        font-family: Source Code Pro;
padding:0px;
margin:0px;
      }
.modules-right{
 border: ${border_size} solid ${secondary_color};
margin-top:1rem;
margin-right:1rem;

padding:4px 16px;
border-radius: ${border_radius};

background:${primary_color};
  }
.modules-left {
background:${secondary_color};
border: ${border_size} solid ${primary_color};
margin-top:1rem;
margin-left:1rem;

padding:4px 16px;
border-radius: ${border_radius};
}

#pulseaudio-slider{
margin-left:1rem;
  background:transparent;
  min-width:100px;
  min-height:3px;
}

#pulseaudio-slider slider {
  background: transparent;
  box-shadow:none; 
  background-size:7px;
  min-height: 7px;
}

#pulseaudio-slider highlight {
  background: ${secondary_color};
  border-radius:7px;

}
#pulseaudio-slider trough {

  background: #888888; 

  border-radius:7px;
}
#custom-cava {
    color:${primary_color};
    font-family: "bargraph";
    font-size: 1rem;
margin:0px;
margin-left:0.5rem;
padding:0px;
}
       window#waybar {
        background: transparent;
      }


      #workspaces {
        margin-top:1rem;
        border-radius: ${border_radius};
        border:${border_size} solid ${secondary_color};
        background: ${primary_color};  

padding:4px 16px;
      }

      #workspaces button {
        margin-right: 1rem;
        color: #AAB2BF;
        border-radius: 50%;
      }

      #workspaces button:last-child {
        margin-right: 0px;
      }

      #workspaces button.active {
        color: ${secondary_color};  
      }

      #workspaces button:hover {
        background: none;
        box-shadow: none;
      }

      #clock {
        background:${secondary_color};
        color: ${primary_color};

       }
    '';
  };

}
