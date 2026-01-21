# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

setopt EXTENDED_HISTORY
setopt autocd

autoload -Uz compinit
compinit -C -u

# ~~~~~~~~~~~~~~~ Key Bindings ~~~~~~~~~~~~~~~~~~~~~~~~

bindkey '^[[1;5C' forward-word      # Ctrl+Right
bindkey '^[[1;5D' backward-word     # Ctrl+Left
bindkey '^[[3~' delete-char         # Delete
bindkey '^[[H' beginning-of-line    # Home
bindkey '^[[F' end-of-line          # End

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# config
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias ..="cd .."

alias t='tmux'
alias e='exit'

# git aliases
function git_current_branch() {
  local ref
  ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

gacp() {
  if [ -z "$1" ]; then
    echo "Commit message required"
    return 1
  fi
  
  local branch=$(git_current_branch)
  
  if [[ "$branch" == "master" || "$branch" == "main" ]]; then
    echo "⚠️  You are on branch '$branch'"
    read "REPLY?Commit to $branch? (Y/n) "
    if [[ $REPLY =~ ^[Nn]$ ]]; then
      echo "Commit cancelled"
      return 1
    fi
  fi
  
  git add -A
  git commit -m "$*"
  ggpush
}

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gcm='git commit -m'
alias gs='git status'
alias gsm='git switch master'
alias gsc='git switch -c'
alias gsmp='gsm && ggpull'
alias ggpush='git push origin "$(git_current_branch)"'
alias ggpull='git pull origin "$(git_current_branch)"'
alias lg='lazygit'

# ansible aliases
export ANSIBLE_STRATEGY="mitogen_linear"
export ANSIBLE_STRATEGY_PLUGINS="/Users/user/repo/mitogen-0.3.31/ansible_mitogen/plugins/strategy"
export ANSIBLE_VAULT_PASSWORD_FILE="~/vault.pass"
alias ap='ansible-playbook'

# kubernetes aliases
alias k='kubectl'

# custom aliases
# analyze docker images, eg "dive image:tag"
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock docker.io/wagoodman/dive"
# history aliases
alias ha='history 1'
alias hg='history | grep -i'


# Run autocompletions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# YC
yc() {
    unset -f yc
    source '/Users/user/yandex-cloud/path.bash.inc'
    source '/Users/user/yandex-cloud/completion.zsh.inc'
    yc "$@"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

#zprof
