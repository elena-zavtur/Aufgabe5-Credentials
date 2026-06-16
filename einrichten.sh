#!/bin/bash

#Paketliste aktualieseren
echo "Aktualiesere Paketlisten..."
sudo apt update
sleep 2

# Installierte Software aktualisieren
echo "Aktualisiere Software..."
sudo apt upgrade -y
sleep 2

# Programme tree und firefox installieren
echo "Installiere tree und firefox..."
sudo apt install tree firefox -y
sleep 2

# Benutzer erstellen
echo "Erstelle Benutzer..."
sudo useradd -m lalo
sudo useradd -m mimi
sudo useradd pepa
sleep 2

# Gruppe erstellen
echo "Erstelle Grruppen..."
sudo groupadd ag
sudo groupadd arbeiter
sleep 2

# Benutzer in den Gruppen hinzufügen
echo "Fuege Benutzer zu Gruppe hinzu..."
sudo usermod -aG ag lalo
sudo usermod -aG arbeiter mimi
sudo usermod -aG arbeiter pepa
sleep 2

# Verzeichnisstruktur erstellen
echo "Erstelle Verzeichniss..."
sudo mkdir -p /home/lalo/ag
sudo mkdir -p /home/lalo/ag/kasse
sudo mkdir -p /home/lalo/ag/personal/Credentials
sudo mkdir -p /home/lalo/ag/personal/Zeiten
sudo mkdir -p /home/lalo/logs
sleep 2

# Credentials kopieren
echo "Kopiere Credentials..."
sudo cp credentials-FI/* /home/lalo/ag/personal/Credentials/
sleep 2

# Passwoerter setzen
echo "Setze Passwoerter..."
sudo cat /home/lalo/ag/personal/Credentials/credentlalo | sudo chpasswd
sudo cat /home/lalo/ag/personal/Credentials/credentmimi | sudo chpasswd
sudo cat /home/lalo/ag/personal/Credentials/credentpepa | sudo chpasswd
sleep 2

# Cronjob erstellen
echo "Erstelle Cronjob..."
echo "@reboot date >> /home/lalo/logs/datum.log" | sudo crontab -u lalo -
sleep 2

# Alias erstellen
echo "Erstelle Alias..."
sudo bash -c "echo \"alias rb='reboot'\" >> /home/lalo/.bashrc"
sleep 2

# Script beenden
echo "Script ist fertig."
sleep 1
echo "5"

sleep 1
echo "4"

sleep 1
echo "3"

sleep 1
echo "2"

sleep 1
echo "1"
 
sudo reboot



