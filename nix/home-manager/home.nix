{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "mitsu";
    homeDirectory = "/Users/mitsu";

    stateVersion = "24.05";

    packages = with pkgs; [
      curl
      fzf
      gh
      ghq
      git
      tree
      wget
    ];

    file = {
      ".ssh/config".text = ''
        Host mitsu-desktop
          User mitsu
          HostName 192.168.11.100
          Port 22222
          TCPKeepAlive yes
          Identitiesonly yes
          IdentityFile ~/.ssh/id_ed25519_mitsu-desktop.pub
        Host *
          AddKeysToAgent yes
          ForwardAgent yes
          UseKeychain yes
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      '';
    };

    sessionVariables = {
      EDITOR = "code";
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM = "1";
    };
  };

  programs = {
    home-manager.enable = true;

    git = {
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
        "url \"git@github.com:\"".insteadOf = "https://github.com/";
        push = {
          default = "current";
          autoSetupRemote = "true";
        };
      };
    };

    zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
      };

      initExtraFirst = ''
        eval $(ssh-agent -s)

        eval $(/opt/homebrew/bin/brew shellenv)
      '';

      initExtra = ''
        # path
        export ANDROID_HOME=~/Library/Android/sdk
        export ANDROID_SDK_ROOT=~/Library/Android/sdk
        export CARGO_HOME=~/.cargo
        export FLUTTER_HOME=~/dev/flutter
        export RUBY_HOME=/opt/homebrew/opt/ruby
        export CMDLINE_TOOLS_HOME=~/dev/cmdline-tools
        export VOLTA_HOME=~/.volta
        export DENO_HOME=~/.deno
        export UV_HOME=~/.local
        export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$CARGO_HOME/bin:$CMDLINE_TOOLS_HOME/bin:$FLUTTER_HOME/bin:$RUBY_HOME/bin:$VOLTA_HOME/bin:$DENO_HOME/bin:$UV_HOME/bin:$PATH

        # Dev Container からホストの SSH 鍵を参照するため
        # @SEE https://horimisli.me/entry/use-1password-ssh-key-from-container/
        if [[ "$OSTYPE" == "darwin"* ]]; then
          export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
        fi

        ## zsh テーマを反映
        source ~/.config/zsh/headline.zsh-theme
      '';

      shellAliases = {
        # command
        "android" = "open -na \"/Applications/Android Studio.app\" --args";
        "code-workspace" = "workspace=\$(ls ~/ghq/workspace/ | fzf --reverse); if [[ -n \${workspace} ]]; then code ~/ghq/workspace/\${workspace}; fi";

        # shorthand
        "c" = "co";
        "co" = "repo=$(g); if [[ \${repo} =~ (.+)/ghq/(.+) ]]; then code \"\${repo}\"; fi";
        "cu" = "repo=$(g); if [[ \${repo} =~ (.+)/ghq/(.+) ]]; then cursor \"\${repo}\"; fi";
        "cw" = "code-workspace";
        "ze" = "repo=$(g); if [[ \${repo} =~ (.+)/ghq/(.+) ]]; then zed \"\${repo}\"; fi";
        "g" = "echo $(ghq root)/$(ghq list | fzf --reverse)";
        "gd" = "repo=$(g); if [[ \${repo} =~ (.+)/ghq/(.+) ]]; then cd \"\${repo}\"; fi";
        "sw" = "branch=$(git branch | sed 's/\* //' | sed 's/  //' | fzf --reverse); if [[ -n \${branch} ]]; then git switch \${branch}; fi";
        "del" = "git branch -d $(git branch | fzf --reverse)";
      };

      oh-my-zsh = {
        enable = true;

        plugins = [
          "git"
        ];
      };
    };
  };
}
