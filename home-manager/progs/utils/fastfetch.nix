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
          separator = " || ";
        };
        modules = [
          "title"
          "separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "shell"
          "display"
          "de"
          "wm"
          "theme"
          "icons"
          "font"
          "cursor"
          "terminal"
          "cpu"
          "gpu"
          "memory"
          "disk"
          "battery"
          "poweradapter"
          "break"
          "colors"
        ];
      };
  };
}
