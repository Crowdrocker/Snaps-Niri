# WehttamSnaps Zsh Configuration
# Optimized for Arch Linux + Niri

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
    git
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
    archlinux
)

source $ZSH/oh-my-zsh.sh

# ==================== USER CONFIGURATION ====================

# Environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='firefox'
export TERMINAL='kitty'

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Gaming drive
export GAMING_DRIVE="/run/media/wehttamsnaps/LINUXDRIVE-1"

# ==================== ALIASES ====================

# System
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias clean='sudo pacman -Sc && yay -Sc'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'

# Yay (AUR)
alias yayup='yay -Syu'
alias yayinstall='yay -S'
alias yayremove='yay -Rns'

# File operations
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Grep with color
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Disk usage
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias myps='ps aux | grep $USER'

# Network
alias ports='netstat -tulanp'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'

# ==================== NIRI SPECIFIC ====================

# Niri
alias niri-reload='niri msg action quit'
alias niri-config='$EDITOR ~/.config/niri/config.kdl'
alias niri-keys='$EDITOR ~/.config/niri/keybinds.kdl'
alias niri-validate='niri validate'

# Noctalia
alias noctalia-config='cd ~/.config/noctalia'

# ==================== AUDIO ====================

# Audio control
alias audio-restart='systemctl --user restart pipewire wireplumber'
alias audio-devices='pactl list sinks short'
alias audio-apps='pactl list sink-inputs'
alias audio-graph='qpwgraph'
alias audio-mixer='pavucontrol'
alias audio-setup-gaming='~/.config/audio/scripts/create-virtual-sinks.sh'
alias audio-setup-streaming='~/.config/audio/scripts/setup-streaming-audio.sh'
alias audio-reset='~/.config/audio/scripts/reset-audio-routing.sh'

# ==================== GAMING ====================

# Gaming mode
alias gaming-on='~/.config/jarvis/scripts/jarvis-gaming.sh'
alias gaming-off='~/.config/jarvis/scripts/jarvis-gaming.sh'
alias gamemode-status='gamemoded -s'

# Steam
alias steam-logs='tail -f ~/.steam/steam/logs/stderr.txt'
alias steam-clear-cache='rm -rf ~/.steam/steam/appcache'

# GPU monitoring
alias gpu-temp='watch -n 1 cat /sys/class/drm/card0/device/hwmon/hwmon*/temp1_input'
alias gpu-usage='watch -n 1 cat /sys/class/drm/card0/device/gpu_busy_percent'
alias gpu-info='glxinfo | grep "OpenGL renderer"'

# ==================== STREAMING ====================

# Streaming
alias streaming-on='~/.config/jarvis/scripts/jarvis-streaming.sh'
alias streaming-off='~/.config/jarvis/scripts/jarvis-streaming.sh'
alias obs-logs='tail -f ~/.config/obs-studio/logs/*.txt'

# ==================== DEVELOPMENT ====================

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# Quick edit configs
alias zshconfig='$EDITOR ~/.zshrc'
alias kittyconfig='$EDITOR ~/.config/kitty/kitty.conf'
alias niriconfig='$EDITOR ~/.config/niri/config.kdl'

# ==================== SYSTEM MONITORING ====================

# System info
alias sysinfo='fastfetch'
alias neofetch='fastfetch'
alias cpu='btop'
alias temps='sensors'

# Logs
alias logs='journalctl -xe'
alias syslogs='sudo journalctl -xe'

# ==================== QUICK ACTIONS ====================

# Quick clean
alias qclean='sudo pacman -Sc && yay -Sc && sudo journalctl --vacuum-time=7d'

# Quick update
alias qupdate='yay -Syu && flatpak update'

# Quick backup
alias qbackup='~/.config/scripts/backup.sh'

# ==================== J.A.R.V.I.S. ====================

# J.A.R.V.I.S. sounds
alias jarvis-startup='~/.config/jarvis/scripts/jarvis-startup.sh'
alias jarvis-shutdown='~/.config/jarvis/scripts/jarvis-shutdown.sh'
alias jarvis-gaming='~/.config/jarvis/scripts/jarvis-gaming.sh'
alias jarvis-streaming='~/.config/jarvis/scripts/jarvis-streaming.sh'

# ==================== FUNCTIONS ====================

# Extract archives
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Make directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find process by name
psgrep() {
    ps aux | grep -v grep | grep -i -e VSZ -e "$@"
}

# Quick note
note() {
    echo "$(date): $*" >> ~/notes.txt
}

# Weather
weather() {
    curl wttr.in/${1:-Chicago}
}

# ==================== STARSHIP PROMPT ====================

# Initialize Starship (if installed)
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# ==================== WELCOME MESSAGE ====================

# Display system info on new terminal
if [[ -o interactive ]]; then
    fastfetch
fi

# ==================== CUSTOM COMPLETIONS ====================

# Enable completion
autoload -Uz compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colored completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ==================== HISTORY ====================

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ==================== KEY BINDINGS ====================

# Use vim keybindings
# bindkey -v

# Or use emacs keybindings (default)
bindkey -e

# ==================== PATH ====================

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Add cargo bin to PATH (if Rust is installed)
export PATH="$HOME/.cargo/bin:$PATH"

# ==================== FINAL MESSAGE ====================

echo ""
echo "💜 WehttamSnaps Niri Setup Loaded!"
echo "Type 'alias' to see all available shortcuts"
echo ""