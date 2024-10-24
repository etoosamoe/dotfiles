# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# directories
export REPOS="$HOME/repo"
export GITUSER="etoosamoe"

alias v=nvim
alias ..="cd .."

alias t='tmux'
alias e='exit'
alias python=/usr/local/bin/python3

# git aliases
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gcm='git commit -m'
alias gs='git status'
alias gsm='git switch master'
alias gsc='git switch -c'
alias gsmp='gsm && ggpull'

# ansible aliases
alias ap='ANSIBLE_STRATEGY=mitogen_linear ANSIBLE_STRATEGY_PLUGINS=/Users/<username>/repo/mitogen-0.3.7/ansible_mitogen/plugins/strategy ANSIBLE_VAULT_PASSWORD_FILE=~/vault.pass ansible-playbook'
alias k='kubectl'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh