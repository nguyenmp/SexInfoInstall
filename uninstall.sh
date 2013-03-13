#! /bin/sh

#Stop the service
if [ -f /opt/lampp/lampp ] ; then
	sudo /opt/lampp/lampp stop
fi


#Remove the installation directory (and all its content)
sudo rm -rf /opt/lampp


dpkg -s ia32-libs > /dev/null
[ $? -eq 0 ] && echo "ia32-libs is still installed.  Dependencies may still exist."
