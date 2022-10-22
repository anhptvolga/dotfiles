#!/bin/bash
#
# Bash script to install my deskstop
# Support: Arch, Manjaro
#

. /etc/os-release

if [[ $ID != 'manjaro' && $ID_LIKE != 'arch' ]]; then
    echo "This system ${ID} is not supported by this script!"
    echo "Just do some common setup!"
fi

_in() {
    yay -Syu --nocleanmenu --nodiffmenu --noupgrademenu --noeditmenu --noconfirm $@
}

common() {
    echo '-> common'
    # yay
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd -
    rm -rf yay
    # zimfw
    _in zsh neovim go
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    # bamboo
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/BambooEngine/ibus-bamboo/master/archlinux/install.sh)"
    # neovim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

install_python() {
    _in python3 python-virtualenv python-pylint yapf
}

install_java() {
    _in gradle maven \
        jdk17-openjdk openjdk17-doc openjdk17-src \
        jdk11-openjdk openjdk11-src openjdk11-doc \
        jdk8-openjdk openjdk8-doc openjdk8-src
    sudo archlinux-java set java-17-openjdk
}

setup_tmux() {
    _in tmux
    TMUX_TEMP=~/.tmux
    mkdir ~/.tmux
    git clone https://github.com/tmux-plugins/tmux-resurrect ${TMUX_TEMP}/resurrect
    git clone https://github.com/tmux-plugins/tmux-continuum ${TMUX_TEMP}/continuum
}

_clone_repo() {
    mkdir -p $2
    git clone $1 $2
}

setup_ssh() {
    echo "Setup ssh..."
    # ssh
    mkdir -p ~/.ssh
    chmod -R 700 ~/.ssh
    touch ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
}

setup_cli_tools() {
    _in base-devel gcc gdb ninja make cmake perf python3 sudo ctags \
         ripgrep xclip curl fzf fd jq bat dex \
        alacritty ctags tldr \
        fash unclutter yq \
        github-cli pgcli mycli
    sudo npm install -g fx
}

setup_tools() {
    _in unicode-emoji tff-hack \
        rofi \
        libinput-gestures wmctrl xdotool autorandr \
        docker docker-compose \
        npm nodejs yarn \
        postgresql \
        blueman bluez bluez-utils \
        sysstat dnsutils inetutils \
        openssh openvpn networkmanager-openvpn \
        htop zip unzip \
        redshift \
        acpi \
        copyq scrot \
        gnome-keyring \
        foliate zathura zathura-pdf-mupdf \
        cpupower \
        x86_energy_perf_policy \
        tree ranger ueberzug \
        kubectl k9s stern \
        jetbrains-toolbox pgmodeler \
        telegram-desktop-bin \
        goldendict \
        brave-bin \
        binance

    TOOLS_HOME=~/github
    mkdir $TOOLS_HOME
    _clone_repo 'https://github.com/brendangregg/FlameGraph' $TOOLS_HOME/FlameGraph
    # get .gdbinit file and customize
    wget -O ~/.gdbinit https://raw.githubusercontent.com/gdbinit/Gdbinit/master/gdbinit
    echo 'set $SHOWOBJECTIVEC = 0
set $SHOWCPUREGISTERS = 0
set $SHOWREGCHANGES = 0
set print pretty on'
    > ~/.gdbinit.local
}

common
setup_tmux
install_python
install_java
setup_tools

