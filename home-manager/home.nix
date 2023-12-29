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
    pkgs.nodejs
    pkgs.peco
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

    initExtraFirst = ''
      eval "$(ssh-agent -s)"
      ssh-add --apple-use-keychain
    '';

    initExtra = ''
      eval $(/opt/homebrew/bin/brew shellenv)
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
