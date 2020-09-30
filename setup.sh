#!/bin/bash
#
# Bash script to install my deskstop
# Support: Arch, Manjaro
#

. /etc/os-release

if [[ $ID != 'manjaro' || $ID_LIKE != 'arch' ]]; then
    echo "This system ${ID} is not supported by this script!"
    echo "Just do some common setup!"
fi

install_depends() {
    if [[ $ID = 'manjaro' ]]; then
        devel=(base-devel gcc gdb ninja make cmake perf kdiff3 diff-so-fancy python3)
        editor=(vim neovim)
        media=(pulseaudio pulseaudio-alsa pulseaudio-bluetooth)
        utils=(sudo zsh tmux tmuxp ripgrep xclip curl fzf fd jq alacritty ctags bat tldr goldendict albert muparser)
        sudo pacman -Sy --needed ${devel[@]} ${editor[@]} ${utils[@]} ${media[@]}
        sudo npm install -g fx
    fi
}

install_python() {
    sudo pacman -Sy --needed python3 python-virtualenv python-pylint yapf
}

install_java() {
    sudo pacman -Sy --needed jdk11-openjdk gradle maven
    sudo archlinux-java set java-11-openjdk
}

clone_repo() {
    mkdir -p $2
    git clone $1 $2
}

setup_common() {
    mkdir ~/.history
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    chsh -s =zsh
}

cp_config_files() {
    for file in .ideavimrc .config .editrc .gitattributes .gitconfig .gitignore_global .gitmsg.txt .inputrc .kutils .myclirc .tmux.conf .vim-coc .vimrc .zimrc; do
        cp $file ~
    done
}

setup_ssh() {
    echo "Setup ssh..."
    # ssh
    mkdir -p ~/.ssh
    chmod -R 700 ~/.ssh
    touch ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
}

setup_vim() {
    echo "Clone & setup vim"
    # vim
    VIMCONFIG='~/.vim'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p ~/.local/share/nvim/site/autoload
    ln -s ~/.vim/autoload/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
}

setup_cpp_tdd() {
    echo "Setup for c++ TDD..."
    # google test
    # google benchmark
}

setup_tools() {
    TOOLS_HOME=~/.devtools
    mkdir $TOOLS_HOME
    clone_repo 'https://github.com/brendangregg/FlameGraph' $TOOLS_HOME/FlameGraph
    # get .gdbinit file and customize
    wget -O ~/.gdbinit https://raw.githubusercontent.com/gdbinit/Gdbinit/master/gdbinit
    echo 'set $SHOWOBJECTIVEC = 0
set $SHOWCPUREGISTERS = 0
set $SHOWREGCHANGES = 0
set print pretty on'
    > ~/.gdbinit.local
}

#setup_common
#setup_ssh
cp_config_files
#setup_vim
#setup_cpp_tdd
#setup_tools

