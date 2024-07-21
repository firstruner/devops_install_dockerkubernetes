clear
echo "[[[   - Version de votre OS -   ]]]"
echo
echo "1 - Ubuntu 22.04"
echo "2 - Alma Linux 9 (Version minimal)"
echo
read -p "Qu'elle est votre version ?" osversion
echo
echo
echo "[[[   - Préparation et récupération des scripts -   ]]]"
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
echo
echo "[[[   - Récupération de Git -   ]]]"
echo
cd $HOME
git clone https://github.com/firstruner/scripts_devops.git
cd scripts_devops
export script_dir
export osversion
bash install.sh
