#! /bin/sh


# Try to install XAMPP
if [ ! -f xampp-linux-1.8.1.tar.gz ] ; then
	echo "XAMPP Installation Archive not found. Downloading..."
	wget http://downloads.sourceforge.net/project/xampp/XAMPP%20Linux/1.8.1/xampp-linux-1.8.1.tar.gz -O xampp-linux-1.8.1.tar.gz
fi

if [ -d /opt/lampp ] ; then
	echo "XAMPP Seems to already be installed in /opt/lampp"
else
	# unzips the xampp installation archive into the installation directory
	echo "Installing XAMPP"
	tar xvfz xampp-linux-1.8.1.tar.gz -C /opt
fi


# Make sure the 32-bit compatability libraries are installed
dpkg -s ia32-libs > /dev/null
if [ $? -eq 0 ] ; then
	echo "32-bit Compatability Library already installed"
else
	echo "Installing 32-bit Compatability Library"
	apt-get install ia32-libs
	ldconfig
fi


# Copies over a modified xampp config file that allows access to localhost/phpmyadmin/
echo "Copying over modified configuration files"
cp ./httpd-xampp.conf /opt/lampp/etc/extra/

# Copy over the php init file that will override the max upload file size
cp ./php.ini /opt/lampp/etc/


# Install sexinfo if it doesn't exist yet
if [ ! -d /opt/lampp/htdocs/sexinfo/ ] ; then
	if [ ! -d ./sexinfo/.git/ ] ; then
		git clone git://github.com/sexinfo/sexinfo.git ./sexinfo/
	fi
	ln -s $PWD/sexinfo/ /opt/lampp/htdocs/
else 
	echo "SexInfo project already installed"
fi


# Configure Druple's file system to allow for it to run
# Druple runs into a file system error. We need to manually create it
if [ ! -d /opt/lampp/htdocs/sexinfo/sites/default/files/ ] ; then
	mkdir /opt/lampp/htdocs/sexinfo/sites/default/files/
fi
chmod 777 /opt/lampp/htdocs/sexinfo/sites/default/files/

# Configure Durple's settings file because it could not be copied
if [ ! -e /opt/lampp/htdocs/sexinfo/sites/default/settings.php ] ; then 
	cp /opt/lampp/htdocs/sexinfo/sites/default/default.settings.php /opt/lampp/htdocs/sexinfo/sites/default/settings.php
fi
chmod 777 /opt/lampp/htdocs/sexinfo/sites/default/settings.php

# Restart the lampp server
# Required for new httpd-xampp.conf file to take effect
echo "Restarting XAMPP"
/opt/lampp/lampp stop
/opt/lampp/lampp start
