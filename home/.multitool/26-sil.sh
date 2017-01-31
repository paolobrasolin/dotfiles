wget -qO - http://packages.sil.org/sil.gpg | sudo apt-key add -
sudo sh -c 'echo "deb http://packages.sil.org/ubuntu vivid main" > /etc/apt/sources.list.d/sil.list'
sudo apt-get update 
apt-cache pkgnames | grep fonts-sil | xargs sudo apt-get install
