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

alias ..="cd .."

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
export ANSIBLE_STRATEGY="mitogen_linear"
export ANSIBLE_STRATEGY_PLUGINS="/Users/ysemyenkov/repo/mitogen-0.3.31/ansible_mitogen/plugins/strategy"
export ANSIBLE_VAULT_PASSWORD_FILE="~/vault.pass"
alias ap='ansible-playbook'

alias k='kubectl'

# custom aliases
# analyze docker images, eg "dive image:tag"
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock docker.io/wagoodman/dive"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh