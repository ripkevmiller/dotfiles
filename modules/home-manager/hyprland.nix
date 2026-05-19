{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    
    enable = true;
    
    settings = {
      "$mod" = "SUPER";
    
      bind = [
        "$mod, Q, exec, alacritty"
        "$mod, SPACE, exec, rofi -show drun"
        "$mod, C, killactive"
        "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"      
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"       
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"      
        "$mod, 9, workspace, 9"
      ];

      exec-once = [
        "hyprpaper"
      ];

      monitor = [
        "DP-5, 2560x1440@144, 0x0, 1"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };
      
      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

    };

  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = "false";
      unload = "/home/drew/pictures/wallpapers/pissarro.jpg";
      wallpaper = [
        {
          monitor = "DP-5";
          path = "/home/drew/pictures/wallpapers/autumn.jpg";
        }
      ];
    };
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./configs/waybar/style.css;
    settings = [{
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = [
          "hyprland/workspaces" 
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "network"
          "pulseaudio"
        ];

        "hyprland/workspaces" = { 
          format = "{name}";
          on-click = "activate"; 
        };

        "hyprland/window" = {
          max-length = 50;
        };

        clock = {
          format = "{:%a. %I:%M %p}";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        network = {
          format = "{icon}";
          format-icons = {
            default = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
          };
          format-ethernet = "󰈀";
          format-disconnected = "󰤫";
        };
      };
    }];

  }; 

}
