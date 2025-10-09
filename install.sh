#!/bin/bash
# WehttamSnaps Niri Setup - Interactive Installer
# Complete installation script for Arch Linux

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ASCII Art Banner
print_banner() {
    echo -e "${PURPLE}"
    cat << "EOF"
    ╦ ╦┌─┐┬ ┬┌┬┐┌┬┐┌─┐┌┬┐╔═╗┌┐┌┌─┐┌─┐┌─┐
    ║║║├┤ ├─┤ │  │ ├─┤│││╚═╗│││├─┤├─┘└─┐
    ╚╩╝└─┘┴ ┴ ┴  ┴ ┴ ┴┴ ┴╚═╝┘└┘┴ ┴┴  └─┘
    ╔╗╔┬┬─┐┬  ╔═╗┌─┐┌┬┐┬ ┬┌─┐
    ║║║│├┬┘│  ╚═╗├┤  │ │ │├─┘
    ╝╚╝┴┴└─┴  ╚═╝└─┘ ┴ └─┘┴  
EOF
    echo -e "${NC}"
    echo -e "${CYAN}Complete Arch Linux + Niri Setup${NC}"
    echo -e "${CYAN}Optimized for Gaming, Streaming & Photography${NC}"
    echo ""
}

# Print section header
print_section() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════${NC}"
    echo ""
}

# Print success message
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Print error message
print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Print warning message
print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# Print info message
print_info() {
    echo -e "${CYAN}ℹ $1${NC}"
}

# Check if running on Arch Linux
check_arch() {
    if [ ! -f /etc/arch-release ]; then
        print_error "This script is designed for Arch Linux only!"
        exit 1
    fi
    print_success "Running on Arch Linux"
}

# Check if running as root
check_root() {
    if [ "$EUID" -eq 0 ]; then
        print_error "Please do not run this script as root!"
        exit 1
    fi
    print_success "Running as regular user"
}

# Interactive menu
show_menu() {
    print_section "Installation Options"
    echo "1) Full Installation (Recommended)"
    echo "2) Niri Window Manager Only"
    echo "3) Noctalia Shell Only"
    echo "4) J.A.R.V.I.S. Theme Only"
    echo "5) Gaming Optimizations Only"
    echo "6) Streaming Setup Only"
    echo "7) Custom Installation (Choose components)"
    echo "8) Exit"
    echo ""
    read -p "Select option [1-8]: " choice
    echo ""
    return $choice
}

# Install base packages
install_base_packages() {
    print_section "Installing Base Packages"
    
    local packages=(
        # Core
        "niri"
        "kitty"
        "thunar"
        "firefox"
        
        # Wayland essentials
        "wayland"
        "xorg-xwayland"
        "wl-clipboard"
        "xdg-desktop-portal"
        "xdg-desktop-portal-gtk"
        
        # Audio
        "pipewire"
        "pipewire-pulse"
        "pipewire-alsa"
        "pipewire-jack"
        "wireplumber"
        "pavucontrol"
        "qpwgraph"
        
        # Utilities
        "rofi-wayland"
        "fuzzel"
        "dunst"
        "grim"
        "slurp"
        "swaylock"
        "brightnessctl"
        "playerctl"
        
        # System tools
        "htop"
        "btop"
        "neofetch"
        "fastfetch"
        "git"
        "wget"
        "curl"
        "unzip"
        "zip"
        
        # Fonts
        "ttf-jetbrains-mono-nerd"
        "ttf-fira-code"
        "noto-fonts"
        "noto-fonts-emoji"
    )
    
    print_info "Installing ${#packages[@]} packages..."
    sudo pacman -S --needed --noconfirm "${packages[@]}"
    print_success "Base packages installed"
}

# Install AUR helper (yay)
install_yay() {
    if command -v yay &> /dev/null; then
        print_success "yay already installed"
        return
    fi
    
    print_section "Installing yay (AUR Helper)"
    
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
    
    print_success "yay installed"
}

# Install Noctalia Shell
install_noctalia() {
    print_section "Installing Noctalia Shell"
    
    # Install Quickshell
    if ! command -v quickshell &> /dev/null; then
        print_info "Installing Quickshell..."
        yay -S --needed --noconfirm quickshell-git
    fi
    
    # Clone Noctalia
    if [ ! -d "$HOME/.config/noctalia" ]; then
        print_info "Cloning Noctalia Shell..."
        git clone https://github.com/noctalia-dev/noctalia-shell.git "$HOME/.config/noctalia"
    else
        print_info "Updating Noctalia Shell..."
        cd "$HOME/.config/noctalia"
        git pull
    fi
    
    print_success "Noctalia Shell installed"
}

# Install gaming packages
install_gaming() {
    print_section "Installing Gaming Packages"
    
    local packages=(
        # Gaming essentials
        "steam"
        "lutris"
        "wine"
        "wine-mono"
        "wine-gecko"
        "winetricks"
        
        # Performance
        "gamemode"
        "lib32-gamemode"
        "mangohud"
        "lib32-mangohud"
        "gamescope"
        
        # AMD GPU tools
        "corectrl"
        "lact"
        
        # Vulkan
        "vulkan-radeon"
        "lib32-vulkan-radeon"
        "vulkan-icd-loader"
        "lib32-vulkan-icd-loader"
        
        # Additional launchers
        "discord"
    )
    
    print_info "Installing gaming packages..."
    sudo pacman -S --needed --noconfirm "${packages[@]}"
    
    # Install Heroic Games Launcher from AUR
    yay -S --needed --noconfirm heroic-games-launcher-bin
    
    print_success "Gaming packages installed"
}

# Install streaming packages
install_streaming() {
    print_section "Installing Streaming Packages"
    
    local packages=(
        "obs-studio"
        "v4l2loopback-dkms"
        "linux-headers"
    )
    
    print_info "Installing streaming packages..."
    sudo pacman -S --needed --noconfirm "${packages[@]}"
    
    print_success "Streaming packages installed"
}

# Install work packages
install_work() {
    print_section "Installing Work/Creative Packages"
    
    local packages=(
        "gimp"
        "inkscape"
        "krita"
        "blender"
    )
    
    print_info "Installing creative software..."
    sudo pacman -S --needed --noconfirm "${packages[@]}"
    
    print_success "Work packages installed"
}

# Copy configuration files
copy_configs() {
    print_section "Copying Configuration Files"
    
    # Create config directories
    mkdir -p "$HOME/.config/niri"
    mkdir -p "$HOME/.config/noctalia"
    mkdir -p "$HOME/.config/jarvis"
    mkdir -p "$HOME/.config/kitty"
    mkdir -p "$HOME/.config/dunst"
    
    # Copy Niri configs
    print_info "Copying Niri configuration..."
    cp -r niri/* "$HOME/.config/niri/"
    
    # Copy J.A.R.V.I.S. configs
    print_info "Copying J.A.R.V.I.S. configuration..."
    cp -r jarvis/* "$HOME/.config/jarvis/"
    chmod +x "$HOME/.config/jarvis/scripts/"*.sh
    
    print_success "Configuration files copied"
}

# Setup J.A.R.V.I.S. sounds
setup_jarvis() {
    print_section "Setting up J.A.R.V.I.S. Theme"
    
    print_info "J.A.R.V.I.S. scripts installed"
    print_warning "Please add your sound files to: ~/.config/jarvis/sounds/"
    print_info "You can create sounds at: https://www.101soundboards.com/"
    
    # Install mpv for sound playback
    sudo pacman -S --needed --noconfirm mpv
    
    print_success "J.A.R.V.I.S. theme setup complete"
}

# Setup gaming optimizations
setup_gaming_optimizations() {
    print_section "Setting up Gaming Optimizations"
    
    # Enable gamemode
    systemctl --user enable --now gamemoded
    
    # Add user to gamemode group
    sudo usermod -a -G gamemode "$USER"
    
    # Configure CoreCtrl
    if command -v corectrl &> /dev/null; then
        print_info "Configuring CoreCtrl..."
        # Enable CoreCtrl service
        systemctl --user enable --now corectrl
    fi
    
    print_success "Gaming optimizations configured"
}

# Setup audio routing
setup_audio() {
    print_section "Setting up Audio Routing"
    
    # Enable PipeWire services
    systemctl --user enable --now pipewire
    systemctl --user enable --now pipewire-pulse
    systemctl --user enable --now wireplumber
    
    print_success "Audio routing configured"
    print_info "Use qpwgraph to configure advanced audio routing"
}

# Create desktop entry
create_desktop_entry() {
    print_section "Creating Desktop Entry"
    
    mkdir -p "$HOME/.local/share/applications"
    
    cat > "$HOME/.local/share/applications/niri.desktop" << EOF
[Desktop Entry]
Name=Niri
Comment=WehttamSnaps Niri Setup
Exec=niri
Type=Application
EOF
    
    print_success "Desktop entry created"
}

# Final setup
final_setup() {
    print_section "Final Setup"
    
    print_info "Setting up shell..."
    
    # Install zsh if not present
    if ! command -v zsh &> /dev/null; then
        sudo pacman -S --needed --noconfirm zsh
    fi
    
    # Install oh-my-zsh if not present
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    
    print_success "Shell configured"
}

# Print post-installation instructions
print_post_install() {
    print_section "Installation Complete!"
    
    echo -e "${GREEN}╔═══════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  WehttamSnaps Niri Setup Installed!          ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}Next Steps:${NC}"
    echo ""
    echo "1. Add J.A.R.V.I.S. sound files:"
    echo "   Place your MP3 files in: ~/.config/jarvis/sounds/"
    echo ""
    echo "2. Configure your display manager to use Niri"
    echo "   Or start Niri manually with: niri"
    echo ""
    echo "3. Review keybindings:"
    echo "   cat ~/.config/niri/keybinds.kdl"
    echo ""
    echo "4. Customize colors:"
    echo "   Edit ~/.config/niri/appearance/colors.kdl"
    echo ""
    echo "5. Join the community:"
    echo "   Discord: https://discord.gg/nTaknDvdUA"
    echo ""
    echo -e "${YELLOW}Important:${NC}"
    echo "- Log out and log back in for group changes to take effect"
    echo "- Some features require a reboot"
    echo ""
    echo -e "${PURPLE}Made with 💜 by WehttamSnaps${NC}"
    echo ""
}

# Main installation function
main() {
    clear
    print_banner
    
    # Pre-flight checks
    check_arch
    check_root
    
    # Show menu and get choice
    show_menu
    choice=$?
    
    case $choice in
        1)
            # Full installation
            install_yay
            install_base_packages
            install_noctalia
            install_gaming
            install_streaming
            install_work
            copy_configs
            setup_jarvis
            setup_gaming_optimizations
            setup_audio
            create_desktop_entry
            final_setup
            print_post_install
            ;;
        2)
            # Niri only
            install_yay
            install_base_packages
            copy_configs
            create_desktop_entry
            print_post_install
            ;;
        3)
            # Noctalia only
            install_yay
            install_noctalia
            print_post_install
            ;;
        4)
            # J.A.R.V.I.S. only
            copy_configs
            setup_jarvis
            print_post_install
            ;;
        5)
            # Gaming only
            install_yay
            install_gaming
            setup_gaming_optimizations
            print_post_install
            ;;
        6)
            # Streaming only
            install_streaming
            setup_audio
            print_post_install
            ;;
        7)
            # Custom installation
            print_warning "Custom installation not yet implemented"
            print_info "Please use option 1 for full installation"
            ;;
        8)
            print_info "Installation cancelled"
            exit 0
            ;;
        *)
            print_error "Invalid option"
            exit 1
            ;;
    esac
}

# Run main function
main