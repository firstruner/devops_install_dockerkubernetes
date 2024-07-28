#!/bin/bash
clear
RED='\033[1;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[1;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m'
OS_NAME=$(cat /etc/os-release | awk -F '=' '/^PRETTY_NAME/{print $2}' | tr -d '"')
OS_NAME_LOWER=$(echo "$OS_NAME" | tr '[:upper:]' '[:lower:]')
export script_dir
export osversion
export cpucount
export RED
export GREEN
export YELLOW
export BLUE
export MAGENTA
export CYAN
export WHITE
export NC
export OS_NAME_LOWER
