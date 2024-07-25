sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo nmcli con mod eth0 ipv4.method auto
sudo mv ifcfg-eth0 /etc/sysconfig/network-scripts/
sudo nmcli con up eth0