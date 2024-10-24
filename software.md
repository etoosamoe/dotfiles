Curated list of applications, brew packages that I use every day (or almost every)

## Applications

- Brew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Brave (earlier Chrome) as main browser.
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
- Bruno — for making custom HTTP requests if I don't want to use cURL.
- DBeaver — GUI for remote databases (*SQL), pretty useful.
- Tomito — nice pomodoro timer
- Clockify — free time tracking software
- VNC Viewer
- Docker Desktop
- Lens - https://k8slens.dev/download - nice GUI for Kubernetes, there should be the way to install free version
- Shottr — top notch free screenshots tool, with crop, annotations, blur
- OBS - screecasts
- Raycast
  - Manage Fallback Commands -> take Google Search up
  - Install extensions (see list below)
  - Make shortcut for Chrome Bookmark Search (Cmd+Shift+B)
  - Install personal raycast-scripts (https://github.com/etoosamoe/raycast-scripts)
- Obsidian
- Stats (*from brew*) — shows CPU temp, load, ram, network in status bar. I used to use [Hot](https://github.com/macmade/Hot) earlier, but it works nicely with Intel CPUs and shows throttling.
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
- stats — System information in menu bar, switched from Hot to Stats - now I've got more info

### RayCast extensions
- Brew
- Base64
- Coffee
- Generate Password
- Kill Process
- Set Slack Status
- IP Geolocation
- Whois
- Check Open Ports from [my repo](https://github.com/etoosamoe/raycast-scripts).


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
- Click on the scroll bar (in a browser for example) jumps to the spot that's clicked instead of by-page scrolling down or up
  - System Settings - Appearance - Jump to the spot that's clicked.

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

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# This is for Infisical Ansible Collection
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

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
```

## Git configuration

Add commit signing:
```
git config --global gpg.format ssh
git config --global user.signingKey ~/.ssh/id_rsa.pub
git config --global commit.gpgsign true
```