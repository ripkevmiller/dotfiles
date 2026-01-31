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
        "alacritty"
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
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

    };

  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = "false";
      wallpaper = [
        {
          monitor = "DP-5";
          path = "/home/drew/pictures/wallpapers/pissarro.jpg";
        }
      ];
    };
  };

}
