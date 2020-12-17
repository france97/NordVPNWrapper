#!/bin/bash

help() {
    echo """Usage: $0 command [arguments...]
Commands:
    c, connect, -c, --connect           Connects you to VPN

Arguments:
Provide a [country] argument to connect to a specific country. For example: 'nordvpn connect Australia'
Provide a [server] argument to connecto to a specific server. For example: 'nordvpn connect jp35'
Provide a [country_code] argument to connect to a specific country. For example: 'nordvpn connect us'
Provide a [city] argument to connect to a specific city. For example: 'nordvpn connect Hungary Budapest'
Provide a [group] argument to connect to a specific servers group. For example: 'nordvpn connect Onion_Over_VPN'
    
    d, disconnect, -d, --disconnect     Disconnects you from VPN
    
    --help, -h                          Shows a list of commands or help for one command
"""
}

connect() {
    nordvpn set killswitch enabled
    nordvpn connect
}

disconnect() {
    nordvpn set killswitch disabled
    nordvpn disconnect
}

if test $# -lt 1
then
    echo "Error in parameter number."
    help
    exit 1
fi

if test $1 == "-h" -o $1 == "--help"
then
    help
    exit 0
fi


if test $1 == "c" -o $1 == "connect" -o $1 == "-c" -o $1 == "--connect"
then
    shift
    connect $@
elif test $1 == "d" -o $1 == "disconnect" -o $1 == "-d" -o $1 == "--disconnect"
then
    disconnect
fi

exit 0
