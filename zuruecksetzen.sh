#!/bin/bash

# Installierte Programme entfernen
echo "Entferne Installierte Programmen..."
sudo apt remove -y tree firefox
sleep 2

# Cronjob löschen
echo "Entferne Cronjob..."
sudo crontab -r -u lalo
sleep 2

# Alias aus der .bashrc entfernen
echo "Entferne Alias 'rb'..."
sudo bash -c 'grep -v "alias rb=" /home/lalo/.bashrc > /home/lalo/.bashrc.new 2>/dev/null && mv /home/lalo/.bashrc.new /home/lalo/.bashr'
sleep 2

# Verzeichnis löschen
echo "Entferne Verzeichnisse..."
sudo rm -rf /home/lalo/ag
sudo rm -rf /home/lalo/logs
sleep 2

# Benutzer löschen
echo "Entferne Benutzer..."
sudo userdel -r lalo
sudo userdel -r mimi
sudo userdel -r pepa
sleep 2

# Gruppen löschen
echo "Entferne Gruppen..."
sudo groupdel ag
sudo groupdel arbeiter
sleep 2

# Script beenden
echo "Script ist fertig."
sleep 2


