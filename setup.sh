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

if [[ $ID = 'manjaro' ]]; then
    devel=(base-devel gcc gdb ninja make cmake perf kdiff3)
    editor=(vim neovim)
    utils=(sudo zsh tmux tmuxp texlive-most ripgrep xclip)

    yes | sudo pacman -Sy --needed $devel $editor $utils
fi

clone_repo() {
    mkdir -p $2
    git clone $1 $2
}

setup_common() {
    mkdir ~/.history
    git clone -b kpanic https://github.com/anhptvolga/zimfw.git ~/.zim
    chsh -s =zsh
}

setup_ssh() {
    echo "Setup ssh..."
    # ssh
    mkdir -p ~/.ssh
    chmod -R 700 ~/.ssh
    touch ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
}
source ~/.zim/zimfw.zsh install
setup_vim() {
    echo "Clone & setup vim"
    # vim
    VIMCONFIG='~/.vim'
    mkdir -p $VIMCONFIG/{pack,start}
    mkdir ~/.vimtmp
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
#setup_vim
#setup_cpp_tdd
#setup_tools

