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
clear
echo
echo -e "${CYAN}[[[   - Verification systeme -   ]]]${NC}"
echo
if [[ $cpucount -gt 1 ]]; then
   echo -e "${GREEN}Votre machine a le nombre minimal de CPU requis${NC}"
else
   echo -e "${RED}Installtation stoppée : Votre machine ne dispose pas de 2 CPU !${NC}"
   exit 1;
fi
echo
echo -e "${CYAN}[[[   - Version de votre OS -   ]]]${NC}"
echo
if [[ "$OS_NAME_LOWER" == *"alma"* ]]; then
   script_dir="AlmaLinux_9"
   dnf update -y
   sudo dnf install git parted -y
   echo "Le système d'exploitation est Alma Linux."
else
   if [[ "$OS_NAME_LOWER" == *"ubuntu"* ]]; then
      script_dir="Ubuntu_22_04"
      sudo apt-get update
      sudo apt-get install -y git gparted
      echo "Le système d'exploitation est Ubuntu."
   else
      echo
      echo "1 - Ubuntu 22.04"
      echo "2 - Alma Linux 8/9 (Version minimale)"
      echo
      read -p "Qu'elle est votre version ?" -n 1 -r osversion
      echo
      echo
      echo -e "${CYAN}[[[   - Préparation et récupération des scripts -   ]]]${NC}"
      echo
      if [[ $osversion = 1 ]]; then
         script_dir="Ubuntu_22_04"
         sudo apt-get update
         sudo apt-get install -y git gparted
      else
         script_dir="AlmaLinux_9"
         dnf update -y
         sudo dnf install git parted -y
      fi
   fi
fi
echo
echo -e "${CYAN}[[[   - Récupération de Git -   ]]]${NC}"
echo
cd $HOME
git clone https://gitlab.com/firstruner/scripts_devops_DockerKubernetes.git
cd scripts_devops
export script_dir
cd $HOME/scripts_devops_DockerKubernetes
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
bash install.sh
