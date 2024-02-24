echo "[[[   - Récupération de Git -   ]]]"
echo
sudo apt-get update
sudo apt-get install -y git gparted
cd $HOME
git clone https://github.com/firstruner/scripts_devops.git
clear
echo
echo
echo "[[[   - PARAMETRAGE DU SYSTEME -   ]]]"
echo
read -p "-->> Voulez-vous ajuster la taille de la partition [y/n] ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy] ]]; then
  gparted
else
  echo " (i) : Il vous est possible à tout moment de lancer l'outils avec la commande gparted"
fi
echo
read -p "-->> Voulez-vous installer Docker maintenant [y/n] ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy] ]]; then
  bash $HOME/scripts_devops/installdocker.sh
else
  echo " (i) : L'installation peux se faire manuellement ou en lançant le script via : bash $HOME/scripts_devops/installdocker.sh"
fi
