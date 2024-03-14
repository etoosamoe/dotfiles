## brew
- ansible (better to install with pip)
- ansible-lint
- zkcli
  - `brew tap let-us-go/zkcli`
  - `brew install zkcli`
- zookeeper
- gnu-sed
- htop
- iperf3
- mc
- ncdu
- neofetch
- s3cmd
- sipcalc
- tmux
- tree
- alt-tab - windows-like app switching, with window previews

### brew cask
- openconnect-gui - VPN Client for Open Connect
- keycastr — Show pressed keys on screen. Good for streams and video.
- vlc
- dozer — hide apps from dock. I don't use it since I changed menu bar spacing
- stats — System information in menu bar

## applications
- brew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- chrome
- todoist - https://todoist.com/ru/downloads
- slack
- telegram - https://github.com/telegramdesktop/tdesktop?tab=readme-ov-file#supported-systems
- iterm2 - https://iterm2.com/downloads.html
- spotify
- sublime text - https://www.sublimetext.com/3
- sublime merge - https://www.sublimemerge.com/download
- outline
- outline manager
- BitWarden - Password manager — https://bitwarden.com/download/
- Strongbox - KeePass format password manager
- Notion
- Tunnelblick - VPN client for OpenVPN
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
  - Manage Fallback Commands -> take Google Search up
  - Install extensions (see list)
  - Make shortcut for Chrome Bookmark Search
  - Install raycast-scripts (https://github.com/etoosamoe/raycast-scripts)
- Obsidian
- Hot - Show CPU temperature in menu bar. https://github.com/macmade/Hot, can be replaced by Stats (brew). Good for Intel CPUs, it shows throttling
- Zoom
- Multipass - for fast Ubuntu virtual machine creation
- BetterDisplay - for external monitor custom resolution (e.g. enable HiDPI on 2k monitor)
- qBitTorrent - https://www.fosshub.com/qBittorrent.html

### RayCast extensions
- Brew
- Base64
- Coffee
- Generate Password
- Kill Process
- Set Slack Status


## MacOS configuration

- Desktop & Dock - Disable Hot Corners
- Disable Spotlight
  - `sudo mdutil -i off`
  - Keyboard - Hotkeys - Disable all in Spotlight menu
- Change Dock size, move it to the left side
- Change menubar spacing
  - `defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6`
  - `defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6`
- Change Dock hiding speed:
  - `defaults write com.apple.dock autohide-time-modifier -float 0.15; killall Dock`
  - `defaults write com.apple.dock "autohide-delay" -float "0.0" && killall Dock`
- Install BetterDisplay and set external display resolution to 2048x1152, HiDPI enabled. It's not native 2k, but it looks nice and sharp with HiDPI enabled.
- Disable `.DS_Store` files creation:
  - `defaults write com.apple.desktopservices DSDontWriteNetworkStores true`

## Terminal configuration

### Install Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Install plugins
- https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
- https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

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

## Git configuration

Add commit signing:
```
git config --global gpg.format ssh
git config --global user.signingKey ~/.ssh/id_rsa.pub
git config --global commit.gpgsign true
```