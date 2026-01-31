{ config, pkgs, ... }:

{

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      "$mod" = "SUPER";
    
      bind = [
        "$mod, Q, exec, alacritty"
        "$mod, SPACE, exec, rofi -show drun"
        "$mod, C, killactive"
        "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit" 
      ];

      exec-once = [
        "alacritty"
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

}
