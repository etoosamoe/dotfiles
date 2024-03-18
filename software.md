Curated list of applications, brew packages that I use every day (or almost every)

## Applications

- Brew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Chrome
- Todoist - https://todoist.com/ru/downloads
- Slack
- Telegram - https://github.com/telegramdesktop/tdesktop?tab=readme-ov-file#supported-systems
- iTerm2 - https://iterm2.com/downloads.html
- Spotify
- Sublime text - https://www.sublimetext.com/3
- Sublime merge - https://www.sublimemerge.com/download
- Outline
- Outline manager
- BitWarden - Password manager — https://bitwarden.com/download/
- Strongbox - KeePass format password manager
- Notion
- Tunnelblick - VPN client for OpenVPN
- Visual Studio Code
- Insomnia — for making custom HTTP requests if I don't want to use cURL.
- Tomito — nice pomodoro timer
- Clockify — free time tracking software
- VNC Viewer
- Docker Desktop
- Lens - https://k8slens.dev/download - nice GUI for Kubernetes, there should be the way to install free version
- Shottr — top notch free screenshots tool, with crop, annotations, blur
- OBS
- Raycast
  - Manage Fallback Commands -> take Google Search up
  - Install extensions (see list below)
  - Make shortcut for Chrome Bookmark Search (Cmd+Shift+B)
  - Install personal raycast-scripts (https://github.com/etoosamoe/raycast-scripts)
- Obsidian
- Hot - Show CPU temperature in menu bar. https://github.com/macmade/Hot, can be replaced by Stats (brew). Good for Intel CPUs, it shows processor throttling
- Zoom
- Multipass - for fast Ubuntu virtual machine creation
- BetterDisplay - for external monitor custom resolution (e.g. enable HiDPI on 2k monitor)
- qBitTorrent - https://www.fosshub.com/qBittorrent.html

### brew

```brew install packagename```

- ansible (better to install with pip)
- ansible-lint
- zkcli
  - `brew tap let-us-go/zkcli`
  - `brew install zkcli`
- htop
- mc - midnight commander
- ncdu
- neofetch
- s3cmd
- sipcalc
- tmux
- tree
- alt-tab - windows-like app switching, with window previews (not installed for now)
- hugo - for [blog](https://etogeek.dev) development

### brew cask

```brew install --cask packagename```

- openconnect-gui - VPN Client for Open Connect
- keycastr — Show pressed keys on screen. Good for streams and video.
- vlc — Well-known video player
- dozer — To hide apps from dock. I don't use it since I changed menu bar spacing.
- stats — System information in menu bar, switched from Hot to Stats - noew I've got more info

### RayCast extensions
- Brew
- Base64
- Coffee
- Generate Password
- Kill Process
- Set Slack Status
- IP Geolocation


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

## IDE

I use VSCode.

- Theme: [Gruvbox Theme](https://marketplace.visualstudio.com/items?itemName=jdinhlife.gruvbox)
- Font: FiraCode Nerd Font, 13pt
- Icons: material-icon-theme
- Extensions:
  - Duplicate Action
  - GitLens (free tier, I really like git blame in a code)
  - Nginx Configuration (syntax highlight)
  - Remote SSH

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