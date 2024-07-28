#!/bin/bash
bash init.sh
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
bash install.sh
