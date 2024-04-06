{ config, pkgs, ... }:

{
  home.username = "nix";
  home.homeDirectory = "/Users/nix";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs._1password
    pkgs.firebase-tools
    pkgs.fzf
    pkgs.ghq
    pkgs.peco
    pkgs.tree
    pkgs.wget
  ];

  home.file = {
    ".ssh/config".text = ''
      Host *
        AddKeysToAgent yes
        UseKeychain yes
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };

  home.sessionVariables = {
    EDITOR = "code";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM = "1";
  };


  programs.home-manager.enable = true;


  programs.gh = {
    enable = true;

    settings = {
      gitProtocol = "ssh";
    };
  };


  programs.git = {
    enable = true;

    userName = "Mitsuoka Takahiro";
    userEmail = "tmitsuoka0423@gmail.com";
    aliases = {
      ac = "!f(){ git add . && git commit -m $1;};f";
      alias = "!git config --get-regexp '^alias\\.' | sed 's/alias\\.\\([^ ]*\\) \\(.*\\)/\\1\\\t => \\2/' | sort";
      b = "!f(){ git branch $1 && git switch $1;};f";
      c = "commit -am";
      ch = "checkout";
      df = "diff --color-words";
      drag = "pull --rebase";
      l = "log --oneline --graph";
      ps = "push";
      sw = "switch";
      st = "status --short --branch";
      sync = "!git pull --rebase && git push";
    };
    extraConfig = {
      interactive = {
        diffFilter = "${pkgs.git}/share/git/contrib/diff-highlight/diff-highlight";
      };
    };
  };


  programs.vscode = {
    enable = true;

    extensions = [
    ];
  };


  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;

    initExtraFirst = ''
      eval $(ssh-agent -s)
      eval $(/opt/homebrew/bin/brew shellenv)
    '';

    initExtra = ''
      # path
      export ANDROID_HOME=~/Library/Android/sdk
      export ANDROID_SDK_ROOT=~/Library/Android/sdk
      export FLUTTER_HOME=~/dev/flutter
      export RUBY_HOME=/opt/homebrew/opt/ruby
      export CMDLINE_TOOLS_HOME=~/dev/cmdline-tools
      export VOLTA_HOME=~/.volta
      export PATH=$ANDROID_HOME/tools:ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$CMDLINE_TOOLS_HOME/bin:$FLUTTER_HOME/bin:$RUBY_HOME/bin:$VOLTA_HOME/bin:$PATH

      # Dev Container からホストの SSH 鍵を参照するため
      # @SEE https://horimisli.me/entry/use-1password-ssh-key-from-container/
      if [[ "$OSTYPE" == "darwin"* ]]; then
        export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
      fi
    '';

    shellAliases = {
      "android" = "open -na \"/Applications/Android Studio.app\" --args";
      "c" = "code $(g)";
      "cu" = "cursor $(g)";
      "g" = "echo $(ghq root)/$(ghq list | fzf --reverse)";
      "gd" = "cd $(g)";
    };

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
      ];
      theme = "jonathan";
    };
  };
}
