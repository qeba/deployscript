#!/bin/bash
# Shell Script user by SenangHost to Deploy new Laravel.
#
# Wrote by qeba-
# This script is intended to be use internally by SenangHost
#
# First script is written on 19/01/2021
# Usage: ./deploy.sh
# Requirement: PHP 7.0 ^
# Composer must been active!!.
# -----------------------------------------------------------------------------

#just var dont usik2. 
current_date=$(date)

printf  "\n"
echo "----------------------------------------------------------------------------------"
printf  "            SenangHost Deploy Deploy New Laravel            \n"
printf  "This script will be use to deploy Laravel project to SenangHost cPanel\n"
echo    "System time: $current_date"
echo "----------------------------------------------------------------------------------"
echo -e "\e[1;31mThis is automate deploy of Laravel for SenangHost \e[0m"
echo -e "\e[1;31mPlease make sure you already create MYSQL for Laravel\e[0m"
echo "----------------------------------------------------------------------------------"
printf  "\n"
echo -e "\e[1;32m √ This script will be use to Deploy Laravel Automatically\e[0m"
echo -e "\e[1;32m √ Please ensure you have create DB/DB user\e[0m"
echo -e "\e[1;32m √ This script will update config for you\e[0m"
printf  "\n"
read -p "Press Enter key when you ready and have follow the requirement? "
printf "Input .zip file name: "
read filename 

echo The file name is: $filename


