#  Manually add contrib non-free
# or this won't work.
apt-get install wicd-curses \
                firmware-iwlwifi
#modprobe -r iwl3945
#modprobe iwl3945
modprobe -r iwlwifi
modprobe iwlwifi
