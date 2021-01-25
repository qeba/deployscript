#!/bin/bash
# Shell Script user by SenangHost to Install Composer on cPanel Server
#
# Wrote by qeba-
# This script is intended to be use internally by SenangHost
#
# First script is written on 19/01/2021
# Usage: ./pre.sh
# Requirement: PHP 7.0 ^
# -----------------------------------------------------------------------------

#variable is here not there nor thum
current_date=$(date)
installDir="installtemp"

echo "----------------------------------------------------------------------------------"
printf "            SenangHost Auto install v1            \n"
printf "This script will be use to automate setup of Composer for cPanel\n"
echo "System time: $current_date"
echo "----------------------------------------------------------------------------------"
mkdir $installDir
cd $installDir

printf "\nInstall Composer...\n"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
printf "Verifying composer installer....\n"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified...'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

printf "\nRunning the installer now....\n"
printf "\nPlease wait might take a while to complete...\n"
run=$(php composer-setup.php)

#copy composer to public_html
printf "\nPutting composer to public_html....\n"
cp composer.phar ../

#delete temp dir
cd ..
rm -rf $installDir
printf "\n"
#simple guide
echo 'To use composer. run "php composer.phar"'
echo "------------------------------------------------"
sleep 3
echo -e "\e[1;31mPlease make sure required PHP extension have enable to use composer \e[0m"
sleep 2
echo -e "\e[1;31mphar/fileinfo/xmlwriter/json \e[0m"
echo "------------------------------------------------"
sleep 3
echo -e "\e[1;32mNext, we will test the composer and this script will end...\e[0m"
sleep 5
read -p "Press any key to resume ..."
printf "\n"

#testing composer running..
echo -e "\e[1;32mThis will run composer version to test composer is working... \e[0m"
printf "\n"
php composer.phar -v
printf "\n"
echo 'Done!... (Start using composer by using;  "php composer.phar"'
printf "\n"

#clear the installation script