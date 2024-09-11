{ config, pkgs, ... }: {
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
    ./home-manager/waybar
  ];

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    cava
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
    ripgrep  # recursively searches directories for a regex pattern
    eza      # A modern replacement for ‘ls’
    fzf      # A command-line fuzzy finder

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
    glow     # markdown previewer in terminal
    btop     # replacement of htop/nmon
    iotop    # io monitoring
    iftop    # network monitoring

    # system call monitoring
    strace   # system call monitoring
    ltrace   # library call monitoring
    lsof     # list open files

    # system tools
    sysstat
    lm_sensors  # for `sensors` command
    ethtool
    pciutils    # lspci
    usbutils    # lsusb
    swww
  ];

 programs.neovim ={
  enable=true;
 };
 home.file.".config/nvim/" = {
source=/home-manager/nvim;
recursive=true;
};
  programs.wofi = {
    enable = true;
    settings = {
      width = 700;
    };
    style = "
      #window {
        background: rgba(0,0,0,1);
        border-radius: 10px;
      }
      #text {
        color: white;
      }
      #outer-box {
        padding: 1rem;
      }
      #input {
        background: rgba(0,0,0,1);
        border-radius: 4px;
        border: 1px solid white;
        margin-bottom: 1rem;
      }
      #entry:selected {
        padding: 1rem;
        border-radius: 4px;
        background: linear-gradient(to right, #6B2A71, #E91E63);
      }
    ";
  };


  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "nahuelDev23";
    userEmail = "nahuel.dev.23@gmail.com";
  };

  programs.fish = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}

