{pkgs, ...}: {
  fonts = {
    # https://search.nixos.org/packages
    packages = with pkgs; [
      jetbrains-mono
    ];
  };
  
  homebrew = {
    enable = true;
      onActivation = {
      autoUpdate = true;
      # !! 注意 !!
      # cleanup = "uninstall";
    };
    casks = [
      "1password"
      "arc"
      "authy"
      "brave-browser"
      "cursor"
      "deepl"
      "discord"
      "docker"
      "google-chrome"
      "karabiner-elements"
      "notion-calendar"
      "raycast"
      "spotify"
      "sublime-text"
      "visual-studio-code"
      "warp"
      "zed"
    ];
  };

  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };
  services.nix-daemon.enable = true;

  system = {
    stateVersion = 5;
    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
      };
      dock = {
        autohide = false;
        show-recents = true;
        orientation = "right";
      };
    };
  };
}
