#! /bin/sh

if [ -d /opt/lampp/htdocs/sexinfo/.git ] ; then
	cd /opt/lampp/htdocs/sexinfo/
	git pull origin master
fi
