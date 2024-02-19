## brew
- ansible
- ansible-lint
- zkcli
- zookeeper
- gnu-sed
- grep
- htop
- iperf3
- mc
- ncdu
- neofetch
- s3cmd
- sipcalc
- tmux
- tree

### brew cask
- openconnect-gui
- vlc
- dozer

## applications
- brew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- chrome
- todoist - https://todoist.com/ru/downloads
- slack
- telegram - https://github.com/telegramdesktop/tdesktop?tab=readme-ov-file#supported-systems
- iterm2 - https://iterm2.com/downloads.html
- spotify
- sublimne text - https://www.sublimetext.com/3
- sublime merge - https://www.sublimemerge.com/download
- outline
- outline manager
- BitWarden - https://bitwarden.com/download/
- Strongbox
- Notion
- Tunnelblick
- Visual Studio Code
- Insomnia
- Tomito
- Clockify
- VNC Viewer
- Docker Desktop
- Lens - ?
- Shottr
- Linear Mouse ?
- OBS
- Raycast
- Obsidian
- Hot - https://github.com/macmade/Hot
- Zoom
- Multipass

## MacOS configuration

- Desktop & Dock - Disable Hot Corners
- Disable Spotlight
  - `sudo mdutil -i off`
  - Keyboard - Hotkeys - Disable all in Spotlight menu
- Change Dock size, move it to the left side

## Terminal configuration

### .zshrc
```
# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# config
export BROWSER="chrome"

# directories
export REPOS="$HOME/repo"
export GITUSER="etoosamoe"
export DOTFILES="$REPOS/dotfiles"
export OBSIDIAN_DIR="~/Library/Mobile Documents/iCloud~md~obsidian/Documents/eto_obsidian"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

alias v=nvim
alias ..="cd .."

alias cdblog="cd $REPOS/etogeek-hugo"

alias t='tmux'
alias e='exit'

# git aliases
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gcam='git commit -am'
alias gs='git status'

# ansible aliases
alias ap='ansible-playbook'
```