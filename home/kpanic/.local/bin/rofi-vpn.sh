#!/bin/sh

# Wifi selection menu with rofi


if [ -z "${ROFI_OUTSIDE}" ]; then
    # yoffset=$(( $(xrdb -query | sed -n 's/^Xft.dpi:\t\([0-9]*\)$/\1/p')*20/96 ))
    exec rofi -show-icons -no-custom -modi m:$0 -show m -location 3 # -yoffset $yoffset
fi

case $ROFI_RETV in
    0)
        # Prompt
        printf "\00prompt\037wifi\n"
        printf "\00markup-rows\037true\n"

        nmcli c show | awk '
        ($3 == "vpn") {
            if ($4 == "--") {
                icon = "network-vpn-disconnected-symbolic";
                info = "up " $1;
            } else {
                icon = "network-vpn-symbolic";
                info = "down " $1;
            }
            printf("%s\0info\x1f%s\x1ficon\x1f%s\n", $1, info, icon);
        }'

        ;;
    1)
        case ${ROFI_INFO} in
            *)
                >&2 nmcli -w 0 connection ${ROFI_INFO}
                exit 0
                ;;
        esac
        export ROFI_RETV=0
        exec $0
        ;;
esac

