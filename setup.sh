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
    editor=(vim)
    utils=(sudo zsh tmux tmuxp texlive-most ripgrep xclip)

    yes | sudo pacman -Sy --needed $devel $editor $utils
fi

clone_repo() {
    mkdir -p $2
    git clone $1 $2
}

setup_common() {
    mkdir ~/.history
    # oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    chsh -s /bin/zsh
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
    mkdir -p $VIMCONFIG/{pack,start}
    mkdir ~/.vimtmp
    clone_repo https://github.com/k-takata/minpac.git $VIMCONFIG/pack/minpac/opt
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
}



#setup_common
#setup_ssh
#setup_vim
#setup_cpp_tdd
#setup_tools

