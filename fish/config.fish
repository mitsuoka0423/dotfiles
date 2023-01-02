#rbenvのPATH
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH

#Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# alias
alias g='code (ghq root)/(ghq list | peco)'

# functions
function ghcr
  gh repo create $argv
  ghq get -p mitsuoka0423/$argv
  code (ghq list --full-path -e $argv)
end

function ghcl
  set repo (gh repo list $argv | awk '{ print $1 }' | peco)
  if [ -n "$repo" ]
    ghq get -p $repo
    code (ghq list --full-path -e $repo)
  end
end

# scripts
eval (ssh-agent -c)
ssh-add ~/.ssh/id_ed25519

# others
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

set -gx CARGO_HOME "$HOME/.cargo"
set -gx PATH "$CARGO_HOME/bin" $PATH

set -gx FLUTTER_HOME "$HOME/develop/flutter"
set -gx PATH "$FLUTTER_HOME/bin" $PATH

set -gx BUN_HOME "$HOME/.bun"
set -gx PATH "$BUN_HOME/bin" $PATH

set -gx DENO_HOME "$HOME/.deno"
set -gx PATH "$DENO_HOME/bin" $PATH