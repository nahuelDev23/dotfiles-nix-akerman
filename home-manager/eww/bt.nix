{pkgs,config,...}:{

  home.file.".config/eww/eww.yuck".text = ''
  (defpoll bluetooth-devices :interval "1s"
  `bash ~/.dotfiles/dotfiles-nix-akerman/scripts/bt.sh`)
  (defwindow bluetooth-modal
           :monitor 1
           :geometry (geometry :x "16px"
                               :y "16px"
                               :width "200px"
                               :height "30px"
                               :anchor "top right")
           :stacking "fg"
           :reserve (struts :distance "40px" :side "top")
           :windowtype "dock"
           :wm-ignore false

           (
           eventbox :onclick "eww close bluetooth-modal"
                (bluetooth-modal :text  bluetooth-devices )
            )
  )

           

  (defwidget bluetooth-modal [?text]

    (
      box :class "bluetooth-modal"
          :orientation "v"
          :padding "10px"
          :spacing "5px"
          :visible true
          text
             )
    
  ) 
  '';

  home.file.".config/eww/eww.scss".text = ''
  .bluetooth-modal {
    padding:1rem;
    background-color: #1F1F2F;
    color: #F1E4CD;
    border:3px solid  #F1E4CD;
    border-radius: 7px;
    font-size: 1rem;
  }

  .bluetooth-modal .bt-btn { 
     background:#F1E4CD;
    color: #1F1F2F ;
    }
  '';
  }
