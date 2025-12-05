Curated list of applications, brew packages that I use every day (or almost every)

## Applications

- Brew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Firefox as main browser (earlier - Brave (earlier Chrome))
  - [Elasticvue](https://elasticvue.com/) - GUI client to Elasticsearch clusters. Works as browser extension
  - Flagfox plugin
- [Super Productivity](https://super-productivity.com/) as to-do app / personal task manager. With self-hosted WebDAV sync and wep app. (earlier [Singularity App](https://singularity-app.com/) and [Todoist](https://todoist.com/ru/downloads))
- [Telegram](https://github.com/telegramdesktop/tdesktop) as main messaging app
- iTerm2 - https://iterm2.com/downloads.html
- Spotify and Yandex Music. First for wide range of songs, second for best recommendation system.
- [Sublime text](https://www.sublimetext.com/3)
- [Sublime merge](https://www.sublimemerge.com/download)
- Outline and Outline Manager
- [BitWarden](https://bitwarden.com/download/) - Password manager
- Strongbox - KeePass format password manager - for work purposes
- Obsidian and Notion for different note-taking
- Tunnelblick - VPN client for OpenVPN
- Visual Studio Code
- Bruno — for making custom HTTP requests if I don't want to use cURL.
- DBeaver — GUI for remote databases (*SQL), pretty useful.
- Clockify — free time tracking software, but Super Productivity can replace it
- [SwitchHosts](https://github.com/oldj/SwitchHosts) - Manage local /etc/hosts file
- Docker Desktop
- [Lens](https://k8slens.dev/download) - nice GUI for Kubernetes, there should be the way to install free version
- Shottr — top notch free screenshots tool, with crop, annotations, blur
- OBS - screencasts
- Raycast
  - Manage Fallback Commands -> take Google Search up
  - Install extensions (see list below)
  - Make shortcut for Chrome Bookmark Search (Cmd+Shift+B)
  - Install [personal raycast-scripts](https://github.com/etoosamoe/raycast-scripts)
- Stats (*via brew*) — shows CPU temp, load, ram, network in status bar. I used to use [Hot](https://github.com/macmade/Hot) earlier, because it works nicely with Intel CPUs and shows throttling.
- Multipass - for fast Ubuntu virtual machine creation
- BetterDisplay - for external monitor custom resolution (e.g. enable HiDPI on 2k monitor)
- [qBitTorrent](https://www.fosshub.com/qBittorrent.html)
- [noTunes](https://github.com/tombonez/noTunes) - disables Apple Music completely, it opens sometimes when I press "play" hotkey
- [httptap](https://github.com/ozeranskii/httptap) (*via brew*) - to measure HTTP request time from CLI.

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
- s3cmd
- pyenv
- node
- jq
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

### pip

- ansible
- infisical-python

### Other software

- [Yandex CLI](https://yandex.cloud/ru/docs/cli/quickstart)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)

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
[.zshrc](.zshrc)

## Git configuration

Initial config:
```
git config --global user.email "<my-email>@gmail.com"
git config --global user.name "Yuriy Semyenkov"
```

Add commit signing:
```
git config --global gpg.format ssh
git config --global user.signingKey ~/.ssh/id_rsa.pub
git config --global commit.gpgsign true
```