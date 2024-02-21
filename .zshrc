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

export PATH="/Users/ysemyenkov/Library/Python/3.9/bin:$PATH"

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# config
export BROWSER="chrome"

# directories
export REPOS="$HOME/repo"
export GITUSER="etoosamoe"
export DOTFILES="$REPOS/dotfiles"
export OBSIDIAN_DIR="~/Library/Mobile Documents/iCloud~md~obsidian/Documents/eto_obsidian"

alias v=nvim
alias ..="cd .."

alias cdblog="cd $REPOS/etogeek-hugo"

alias t='tmux'
alias e='exit'
alias python=/usr/local/bin/python3

# git aliases
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gcam='git commit -am'
alias gs='git status'

# ansible aliases
alias ap='ansible-playbook'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh