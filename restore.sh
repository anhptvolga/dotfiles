#!/usr/bin/env bash

isync() {
    procs=`expr $(nproc) \* 2`
    printf "%s\n" $@ | xargs -P$procs -I_ cp -rp _ /_
}


isync home/kpanic/.config/alacritty \
home/kpanic/.config/awesome \
home/kpanic/.config/autostart \
home/kpanic/.config/bat \
home/kpanic/.config/coc/extensions/package.json \
home/kpanic/.config/copyq/copyq.conf \
home/kpanic/.config/htop/htoprc \
home/kpanic/.config/JetBrains/IntelliJIdea2022.2/idea.properties \
home/kpanic/.config/k9s/skins \
home/kpanic/.config/k9s/hotkey.yml \
home/kpanic/.config/k9s/skin.yml \
home/kpanic/.config/nvim \
home/kpanic/.config/pgcli/config \
home/kpanic/.config/ranger \
home/kpanic/.config/redshift \
home/kpanic/.config/rofi \
home/kpanic/.config/libinput-gestures.conf \
home/kpanic/.config/mimeapps.list \
 \
home/kpanic/.local/share/applications/wifi.desktop \
home/kpanic/.local/share/applications/monitor.desktop \
home/kpanic/.local/share/applications/bitwarden.desktop \
home/kpanic/.local/bin/bwmenu \
home/kpanic/.local/bin/lib-bwmenu \
home/kpanic/.local/bin/pgcli2dk \
home/kpanic/.local/bin/rofi-vpn.sh \
home/kpanic/.local/bin/rofi-wifi.sh \
home/kpanic/.local/bin/rofi-network.sh \
home/kpanic/.local/bin/rofi-monitor-layout.sh \
home/kpanic/.local/bin/generate.sh \
 \
home/kpanic/.gitattributes \
home/kpanic/.gitconfig \
home/kpanic/.gitignore_global \
home/kpanic/.gitmsg.txt \
home/kpanic/.inputrc \
home/kpanic/.ideavimrc \
home/kpanic/.npmrc \
home/kpanic/.profile \
home/kpanic/.testcontainers.properties \
home/kpanic/.tmux.conf \
home/kpanic/.Xdefaults \
home/kpanic/.xinitrc \
home/kpanic/.xprofile \
home/kpanic/.zlogin \
home/kpanic/.zimrc

