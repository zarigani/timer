INSTALL_DIRECTORY=${1:-/usr/local/bin}
[ $# = 0 ] && mkdir -p /usr/local/bin

cd `dirname $0`
mv timer $INSTALL_DIRECTORY && echo install $INSTALL_DIRECTORY/timer
mv timer-sync-wake $INSTALL_DIRECTORY && echo install $INSTALL_DIRECTORY/timer-sync-wake
sudo mv timer-add-schedule $INSTALL_DIRECTORY && echo install $INSTALL_DIRECTORY/timer-add-schedule
sudo mv timer-rm-schedule $INSTALL_DIRECTORY && echo install $INSTALL_DIRECTORY/timer-rm-schedule

cd $INSTALL_DIRECTORY
chmod +x timer timer-sync-wake timer-add-schedule timer-rm-schedule && echo chmod +x timer timer-sync-wake timer-add-schedule timer-rm-schedule
sudo chown root:wheel timer-add-schedule timer-rm-schedule && echo chown root:wheel timer-add-schedule timer-rm-schedule
sudo chmod u+s timer-add-schedule timer-rm-schedule  && echo chmod u+s timer-add-schedule timer-rm-schedule