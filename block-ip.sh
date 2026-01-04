#!/bin/bash

block_ip() {
    if [[ "$(uname)" == "Linux" ]]; then
        if command -v apt-get &> /dev/null; then
            read -r -p "Enter Source IP Prefix or IP Address you want to block = " ip
            for i in $ip; do
                sudo ufw deny from "$i"
            done
        elif command -v yum &> /dev/null || command -v dnf &> /dev/null; then
            read -r -p "Enter Source IP Prefix or IP Address you want to block = " ip
            for i in $ip; do
                sudo firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='$i' drop"
            done
            sudo firewall-cmd --reload
        else
            echo "OS not supported, please use this script either on Debian-based or RHEL-based systems"
            exit 1
        fi
    else
        echo "This script only supports Linux systems"
        exit 1
    fi
}

block_ip
