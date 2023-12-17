{ pkgs, ... }:

{
  home.username = "mitsu";
  home.homeDirectory = "/Users/mitsu";
  home.stateVersion = "22.05";


  programs.direnv = {
    enable = true;

    nix-direnv.enable = true;
  };


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


  programs.home-manager = {
    enable = true;
  };


  programs.zsh = {
    enable = true;

    completionInit = "autoload -U compinit && compinit -u";
    dotDir = ".config/zsh";
    syntaxHighlighting = {
      enable = true;
    };
    envExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels

      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
    history = {
      extended = true;
      save = 1000000;
      size = 1000000;
    };
    shellAliases = {
      android = "open -na \"/Applications/Android Studio.app\" --args";
      g = "echo $(ghq root)/$(ghq list | peco)";
      a = "android $(g)";
      c = "code $(g)";
      cu = "cursor $(g)";
    };
  };
}
