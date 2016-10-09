#!/bin/bash
rfkill block bluetooth uwb ultrawideband wimax wwan gps fm nfc
ifconfig wlan0 down
a="$(macchanger -r wlan0 |grep New\ MAC)"
  if [ "$a" != "[my original MAC]" ] ;
  then
     echo -e "\e[92m$a" ;
  else  
     echo -e "\e[93m$a"
  fi
ifconfig wlan0 up

#User
useradd -m -G sudo h4ll0
nmcli dev wifi connect '[SIID]' password [password] &
  echo extracting
  tar -xJf /media/root/shr/ar/tor-browser*.tar.xz -C /home/h4ll0/
  echo extracted
#Tweak
gsettings set org.gnome.desktop.background    picture-uri         file:///media/root/shr/pics/wins7-bg.jpg
gsettings set org.gnome.desktop.screensaver   picture-uri         file:///media/root/shr/pics/wins10.jpg
#Complete 
cp    /media/root/shr/ar/start-tor.desktop /etc/xdg/autostart/
cp    /media/root/shr/ar/torz.desktop      /etc/xdg/autostart
cp -a /media/root/shr/pics                 /home/h4ll0
cp    /media/root/shr/ar/tor-user          /
if [ ! -f /etc/usbkill.ini ] || [ ! -f /etc/usbkill.py ] ; then 
     cp /media/root/shr/ar/usbkill/install/usbkill.ini /etc/
     cp /media/root/shr/ar/usbkill/usbkill/usbkill.py  /etc/
     chmod 755 /etc/usbkill.{ini,py}
  fi
chmod 777 -R /home/
chmod 755 /etc/xdg/autostart/* /tor-user
#Set passwd
valet=0
  while [ $valet -eq 0 ] ; do
     echo -e "\e[31m----------------------"
     passwd h4ll0
        if ! grep -q 'h4ll0:!:' /etc/shadow ; then
          let valet=1
          echo -e "\e[92m========================="
        fi
  done
gnome-session-quit --no-prompt
