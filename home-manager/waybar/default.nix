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
        output = [ "DVI-I-1" ];
        modules-left = [ "clock" "custom/cava"];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ ];

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
.modules-left {
background:${secondary_color};
border: ${border_size} solid ${primary_color};
margin-top:1rem;
margin-left:1rem;

padding:4px 16px;
border-radius: ${border_radius};
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
