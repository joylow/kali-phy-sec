#!/bin/bash
if [ ! -f /etc/usbkill.ini ] || [ ! -f /etc/usbkill.py ] ; then 
     cp /media/root/shr/ar/usbkill/install/usbkill.ini /etc/
     cp /media/root/shr/ar/usbkill/usbkill/usbkill.py  /etc/
     chmod 755 /etc/usbkill.{ini,py}
  fi
python /etc/usbkill.py &
