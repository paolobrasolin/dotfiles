sudo apt-get install libimlib2-dev libexif-dev
# xlib giflib

timestamp=$( date +%s%N )
dirname=/tmp/sxiv-$timestamp

git clone https://github.com/muennich/sxiv.git $dirname
cd $dirname
make
sudo make install
rm -rf $dirname
