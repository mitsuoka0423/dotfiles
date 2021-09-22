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
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# alias
alias g='cd (ghq root)/(ghq list | peco)'
alias gg='ghq get'

# functions
function ghcr
  gh repo create $argv
  ghq get $argv[1]
  code (ghq list --full-path -e $argv[1])
end

# others
eval (ssh-agent -c)