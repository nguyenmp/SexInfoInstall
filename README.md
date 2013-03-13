About
=====

This is an install script created by Mark Nguyen to install and configure the SexInfo website on a linux machine.  Because the install and configuration process is wrought with potential errors along the way, this script was created to automate the majority of the process.

How To Install
==============

1) Change the permissions for the install script:
`chmod +x install.sh`

2) Execute the install script with root privilages:
`sudo ./install.sh`

3) Go to `localhost/phpmyadmin` in your browser of choice.

4) Select the databases tab.

5) Create a new database named `sexweb00`

6) Select the new database and go to it's "privileges" section

7) Add a new user with the given parameters:

Name: sexweb00m
Password: something you can remember
Host: localhost
Privileges: Grant ALL PRIVILEGES database-specific


How To Use
==========

To start the server, execute the following command:
`sudo /opt/lampp/lampp start`


To stop the server, execute the following command:
`sudo /opt/lampp/lampp stop`


Installation Information
========================

XAMPP is downloaded and installed to `/opt/lampp/`

The SexInfo project folder is under `/opt/lampp/htdocs/`
