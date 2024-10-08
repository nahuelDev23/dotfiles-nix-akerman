{ pkgs, config, ... }:
# puedo poner en config un objeto onda config.colorScheme.colors
let
  modifier = "SUPER"; in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  
     settings = {
           general ={

        resize_on_border=true;
        border_size= 3;
        "col.active_border"="rgb(FFFD82) 60deg";
       
        };
      decoration = {
        rounding = 7;
        drop_shadow = true;
        shadow_range = 0;
        shadow_render_power = 0;
        blur = {
          enabled = true;
          size = 7;
          passes = 4;
        };
      };
      bind = [
        "${modifier},Q,killactive"
        "${modifier},B, exec,hyprlock"
        "${modifier},D,exec,wofi --show drun"
        "${modifier},Return,exec,kitty"
        "${modifier},G,exec,firefox https://chat.openai.com/" # Open ChatGPT
        "${modifier},Y,exec,firefox https://youtube.com/"   
        "${modifier},O,exec,nautilus" 
        "${modifier},K,exec,keepassxc" 
        "${modifier},mouse:272,exec, hyprpicker -a"        
        "${modifier},W,exec, whatsapp-for-linux"        
        "${modifier},P,exec,grim -g \"$(slurp)\" - | wl-copy"
        "${modifier} SHIFT,P,exec,grim -g \"$(slurp)\" ~/Images/-$(date +'%Y-%m-%d_%H-%M-%S').png"
        # Window managemenwhatsapp-for-linuxt
        "${modifier} SHIFT,Right, movewindow , r"
        "${modifier} SHIFT,Left, movewindow , l"
        "${modifier},Left, movefocus , l" # Move window to left
        "${modifier},Right, movefocus , r" # Move window to right
        "${modifier},Down, movefocus , d" # Move window to bottom
        "${modifier},Up, movefocus , u" # Move window to top
        "${modifier},1,workspace,1" # Go to workspace 1
        "${modifier},2,workspace,2" # Go to workspace 2
        "${modifier},3,workspace,3" # Go to workspace 3
        "${modifier},4,workspace,4" # Go to workspace 4
        "${modifier},5,workspace,5" # Go to workspace 5
        "${modifier} SHIFT,1,movetoworkspace,1" # Move current window to workspace 1
        "${modifier} SHIFT,2,movetoworkspace,2" # Move current window to workspace 2
        "${modifier} SHIFT,3,movetoworkspace,3" # Move current window to workspace 3
        "${modifier} SHIFT,4,movetoworkspace,4" # Move current window to workspace 4
        "${modifier} SHIFT,5,movetoworkspace,5" # Move current window to workspace 5
        "${modifier} , J,resizeactive,10 0 "
        "${modifier} , H,resizeactive,-10 0 "
        ];
        windowrulev2 =[
          "opacity .9 override,class:^(discord)$"
        ];
          
      exec-once = [
        "swww-daemon"
        "swww img /home/akerman/.dotfiles/dotfiles-nix-akerman/wallpaper.png"
        "waybar"
      ];
 
    };
    };
}

