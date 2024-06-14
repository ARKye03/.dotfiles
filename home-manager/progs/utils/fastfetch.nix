{ ... }: {
  programs.fastfetch = {
    enable = true;
    settings =
      {
        logo = {
          padding = {
            top = 2;
          };
        };
        display = {
          binaryPrefix = "si";
          color = "blue";
          separator = ": ";
        };
        modules = [
          "title"
          "separator"
          {
            "type" = "os";
            "key" = " ";
          }
          {
            "type" = "host";
            "key" = " ";
          }
          {
            "type" = "kernel";
            "key" = " ";
          }
          {
            "type" = "uptime";
            "key" = " ";
          }
          {
            "type" = "shell";
            "key" = "󱆃 ";
          }
          {
            "type" = "display";
            "key" = " ";
          }
          {
            "type" = "de";
            "key" = " ";
          }
          {
            "type" = "wm";
            "key" = " ";
          }
          {
            "type" = "theme";
            "key" = "󰔎 ";
          }
          {
            "type" = "icons";
            "key" = " ";
          }
          {
            "type" = "font";
            "key" = " ";
          }
          {
            "type" = "cursor";
            "key" = "󰇀 ";
          }
          {
            "type" = "terminal";
            "key" = " ";
          }
          {
            "type" = "cpu";
            "key" = " ";
          }
          {
            "type" = "gpu";
            "key" = " ";
          }
          {
            "type" = "memory";
            "key" = "󰍛 ";
          }
          "disk"
          {
            "type" = "disk";
            "key" = " ";
          }
          {
            "type" = "battery";
            "key" = "󱈑 ";
          }
          "poweradapter"
          "break"
          "colors"
        ];
      };
  };
}
