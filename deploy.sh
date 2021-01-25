#!/bin/bash
# Shell Script user by SenangHost to Deploy Laravel project.
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
printf  "            SenangHost Deploy Laravel Project v1            \n"
printf  "This script will be use to deploy Laravel project to SenangHost cPanel\n"
echo    "System time: $current_date"
echo "----------------------------------------------------------------------------------"
echo -e "\e[1;31mPLEASE MAKE SURE YOUR HAVE PUT THE ZIPPED FILES IN THE PUBLIC_HTML \e[0m"
echo -e "\e[1;31mTHIS CODE MAY NOT USEABLE IF YOU NOT FOLLOW THE GUIDE...\e[0m"
echo "----------------------------------------------------------------------------------"
printf  "\n"
echo -e "\e[1;32m √ Ensure that your zip files is not extract yet, just upload the zip files only\e[0m"
echo -e "\e[1;32m √ Ensure All the basic PHP Extension have enable\e[0m"
echo -e "\e[1;32m √ Ensure Ensure to use PHP 7.3 and above\e[0m"
printf  "\n"
read -p "Press Enter key when you ready and have follow the requirement? "
printf "Input .zip file name: "
read filename 

echo The file name is: $filename
