#zmodload zsh/zprof

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

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# config
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias ..="cd .."

alias t='tmux'
alias e='exit'

# git aliases
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gcm='git commit -m'
alias gs='git status'
alias gsm='git switch master'
alias gsc='git switch -c'
alias gsmp='gsm && ggpull'
alias ggpull='git pull origin "$(git_current_branch)"'
alias lg='lazygit'

# ansible aliases
export ANSIBLE_STRATEGY="mitogen_linear"
export ANSIBLE_STRATEGY_PLUGINS="/Users/username/repo/mitogen-0.3.31/ansible_mitogen/plugins/strategy"
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

# yandex cloud cli
yc() {
    unset -f yc
    source '/Users/username/yandex-cloud/path.bash.inc'
    source '/Users/username/yandex-cloud/completion.zsh.inc'
    yc "$@"
}

# NVM
export NVM_DIR="$HOME/.nvm"

nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm "$@"
}

node() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}

npm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}

npx() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npx "$@"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

#zprof
