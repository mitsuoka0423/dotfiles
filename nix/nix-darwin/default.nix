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
      "visual-studio-code"
      "warp"
      "zed"
    ];

    masApps = {
      "Display menu" = 549083868;
      "Flow" = 1423210932;
      "Hyper Cursor" = 1634220679;
      "LINE" = 539883307;
      "Monosnap" = 540348655;
    };
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
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true; # macOSアップデートの自動インストール
      NSGlobalDomain = {
        AppleShowAllExtensions = true; # すべてのファイル拡張子を表示
      };
      dock = {
        autohide = false; # Dockの自動非表示をオフ
        largesize = 100; # Dock拡大時のサイズ
        magnification = true; # Dockの拡大機能を有効化
        mineffect = "suck"; # Dockのミニマイズエフェクト
        mru-spaces = false; # スペースの自動入れ替えをオフ
        orientation = "right"; # Dockの位置を右側に設定
        show-recents = false; # 最近使用したアプリを非表示
        static-only = true; # 開いているアプリのみをDockに表示
        tilesize = 15; # Dockの通常サイズ
      };
      finder = {
        _FXSortFoldersFirst = true; # フォルダを常にトップに表示
        AppleShowAllFiles = true; # 隠しファイルを表示
        AppleShowAllExtensions = true; # すべてのファイル拡張子を表示
        FXDefaultSearchScope = "SCcf"; # 検索スコープをカレントフォルダ配下に変更
        FXEnableExtensionChangeWarning = false; # 拡張子変更時の警告を無効化
        FXPreferredViewStyle = "Nlsv"; # デフォルトをリストビューに変更
        ShowPathbar = true; # パスバーを表示
        ShowStatusBar = true; # ステータスバーを表示
      };
      screencapture = {
        show-thumbnail = false; # スクリーンショット撮影後のサムネイルを非表示
      };
    };
  };
}
