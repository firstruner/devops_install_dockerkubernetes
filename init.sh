#!/bin/bash
clear
# BOLD COLORS
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
BG_BLACK='\033[0;40m'
BG_RED='\033[0;41m'
BG_GREEN='\033[0;42m'
BG_YELLOW='\033[0;43m'
BG_BLUE='\033[0;44m'
BG_MAGENTA='\033[0;45m'
BG_CYAN='\033[0;46m'
BG_GRAY='\033[0;47m'
# LIGHT COLORS
LIGHT_BLACK='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
LIGHT_YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_MAGENTA='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
LIGHT_GRAY='\033[1;37m'
BG_LIGHT_BLACK='\033[1;40m'
BG_LIGHT_RED='\033[1;41m'
BG_LIGHT_GREEN='\033[1;42m'
BG_LIGHT_YELLOW='\033[1;43m'
BG_LIGHT_BLUE='\033[1;44m'
BG_LIGHT_MAGENTA='\033[1;45m'
BG_LIGHT_CYAN='\033[1;46m'
BG_LIGHT_GRAY='\033[1;47m'
# CANCEL COLORS
NC='\033[0m'
# SYSTEM VALUES
OS_NAME=$(cat /etc/os-release | awk -F '=' '/^PRETTY_NAME/{print $2}' | tr -d '"')
OS_NAME_LOWER=$(echo "$OS_NAME" | tr '[:upper:]' '[:lower:]')
cpucount=$((lscpu | egrep 'Processeur\(s\)|CPU\(s\)' | awk -F: '{print $2}' | head -n 1) | sed 's/^[ \t]*//;s/[ \t]*$//')
# EXPORTS
export osversion
export cpucount
export OS_NAME_LOWER

export RED
export GREEN
export YELLOW
export BLUE
export MAGENTA
export CYAN
export GRAY

export LIGHT_RED
export LIGHT_GREEN
export LIGHT_YELLOW
export LIGHT_BLUE
export LIGHT_MAGENTA
export LIGHT_CYAN
export LIGHT_GRAY

export BG_RED
export BG_GREEN
export BG_YELLOW
export BG_BLUE
export BG_MAGENTA
export BG_CYAN
export BG_GRAY

export BG_LIGHT_RED
export BG_LIGHT_GREEN
export BG_LIGHT_YELLOW
export BG_LIGHT_BLUE
export BG_LIGHT_MAGENTA
export BG_LIGHT_CYAN
export BG_LIGHT_GRAY

export NC
