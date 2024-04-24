{ ... }: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        mode = "waves";
        framerate = 30;
        bar_spacing = 0;
      };
      color = {
        background = "'#1e1e2e'";
        gradient = 1;

        gradient_color_1 = "'#94e2d5'";
        gradient_color_2 = "'#89dceb'";
        gradient_color_3 = "'#74c7ec'";
        gradient_color_4 = "'#89b4fa'";
        gradient_color_5 = "'#cba6f7'";
        gradient_color_6 = "'#f5c2e7'";
        gradient_color_7 = "'#eba0ac'";
        gradient_color_8 = "'#f38ba8'";
      };
    };
  };
}