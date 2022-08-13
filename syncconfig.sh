#!/usr/bin/env bash

isync() {
    procs=`expr $(nproc) \* 2`
    des=$1
    shift 1
    printf "%s\n" $@ | xargs -P$procs -I_ bash -c "rsync -a _ $des/_"
}

# ~/.config/!awesome \

isync .config \
 \
~/.config/alacritty \
~/.config/autostart \
~/.config/bat \
~/.config/coc/extensions/package.json \
~/.config/copyq/copyq.conf \
~/.config/htop/htoprc \
~/.config/JetBrains/IntelliJIdea2022.2/idea.properties \
~/.config/k9s/skins \
~/.config/k9s/hotkey.yml \
~/.config/k9s/skin.yml \
~/.config/nvim \
~/.config/pgcli/config \
~/.config/ranger \
~/.config/redshift \
~/.config/rofi \
~/.config/libinput-gestures.conf \
~/.config/mimeapps.list

isync .local \
~/.local/share/applications/wifi.desktop \
~/.local/share/applications/monitor.desktop \
~/.local/share/applications/bitwarden.desktop \
~/.local/bin/bwmenu \
~/.local/bin/lib-bwmenu \
~/.local/bin/pgcli2dk \
~/.local/bin/rofi-vpn.sh \
~/.local/bin/rofi-wifi.sh \
~/.local/bin/rofi-network.sh \
~/.local/bin/rofi-monitor-layout.sh \
~/.local/bin/generate.sh 

isync home \
~/.gitattributes \
~/.gitconfig \
~/.gitignore_global \
~/.gitmsg.txt \
~/.inputrc \
~/.ideavimrc \
~/.npmrc \
~/.profile \
~/.testcontainers.properties \
~/.tmux.conf \
~/.Xdefaults \
~/.xinitrc \
~/.xprofile \
~/.zlogin \
~/.zimrc

