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

#where the function stay and dont run
function prunzip() {
   printf  "\n"
   printf  "[ "
   unzip -o $1 -d $2 | awk 'BEGIN {ORS=" "} {if(NR%35==0)print "==="}'
   printf  " !]"
   printf "\n"
   echo -e "\e[1;32m...All Done!!..\e[0m"
}

function cmpsrInstall() {
   printf "\n"
   cd ../laravelData
   php composer.phar install
   cd .. #get back to where you come from bro!!
   echo -e "\e[1;32mIf you see this it's means you're half way...\e[0m"
}

function LaravelClear() {
   cd ./laravelData
   php artisan optimize:clear
   cd ..
}

# #function end here!!!

#### Step 1
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
echo -e "\e[1;32m √ Ensure You have run the Composer Install using pre.sh\e[0m"
printf  "\n"
read -p "Press Enter key when you ready and have follow the requirement? "
printf "Input .zip file name: "
read filename 

#unzip files
echo "Plesae wait... and do not do anything....... Extracting your data now....-$filename"
prunzip $filename "../laravelData"
printf  "\n"
echo -e "Time to do some magic...."
sleep 2

#send public files to public_html (safety first)
echo  "..............."
cp -ra ../laravelData/public/. ../public_html/.
echo  "......................"
sleep 1
echo  "............................"
rm -rf public
echo  "......................................"
printf  "\n"

#get composer then install the composer / update vendor files
echo "More magic coming.. this one will take few minutes, stay back and get ur coffee...."
echo  "..................."
cp ../public_html/composer.phar ../laravelData
echo  "..........................."
cmpsrInstall
sleep 2
printf  "\n"

#update index.php
echo  "Step 1 Completed!....."
sed -i "s!__DIR__.'/..!'../laravelData!" "./public_html/index.php" 
sleep 1
echo  "..............................."
sleep 2
echo  "......................................"
sleep 1

#### Step 2
clear
#update env files / mysql config
echo "----------------------------------------------------------------------------------"
echo -e "\e[1;32m Next step, update .env files\e[0m"
echo -e "\e[1;32m This step will required you to input all details to update env files\e[0m"
echo "----------------------------------------------------------------------------------"
echo -e "\e[1;31mThings to check;\e[0m"
echo -e "\e[1;31m -- √ Ensure you already create the Database and Database User\e[0m"
echo -e "\e[1;31m -- √ Ensure have Import SQL files to the database  \e[0m"
echo "----------------------------------------------------------------------------------"
echo "Reminder: This script cannot read your mind...."
printf  "\n"
echo "Let's begin..."
printf  "\n"
read -p "Press Enter to continue.? "
clear

#get user data then replace inside .env files
printf "Website URL (ex: http://senanghost.com): "
read url 

printf "Database Name: "
read dbName

printf "Database User: "
read dbUser

printf "Database Password: "
read dbPassword

printf  "\n"
echo "Updating env files.... Please wait..."
echo ".........update web app url..............."
echo "................................................"
sed -i "s!APP_URL=.*!APP_URL=$url!" "./laravelData/.env" 
sleep 1
printf  "\n"
echo ".........update database information..............."
sed -i "s!DB_DATABASE=.*!DB_DATABASE=$dbName!" "./laravelData/.env" 
sleep 2
echo "........................"
sed -i "s!DB_USERNAME=.*!DB_USERNAME=$dbUser!" "./laravelData/.env" 
sleep 2
echo "..................................." 
sed -i "s+DB_PASSWORD=.*+DB_PASSWORD=$dbPassword+g" "./laravelData/.env" 
sleep 2
echo "............................................"
sleep 1

#### Step 3

# #do all cache clear using php artisan.
printf  "\n"
echo "Almost there... this is last step..."
printf  "\n"
echo "Next magic coming...... Please wait..."
echo "........................"
LaravelClear
echo "............................................"
printf  "\n"
#fix storage link later!!
sleep 2
echo "Time to fix the storage folder."
echo "........"
sleep 2
rm -rf ./public_html/storage
sleep 1
echo "............."

pubLoc=`cd ./public_html && pwd`
LrvDataLoc=`cd ./laravelData && pwd`
echo "Your pubcli_html is located; $pubLoc"
echo "Your laravel data is locoated; $LrvDataLoc"
sleep 1
echo "................"
ln -s $LrvDataLoc/storage/app/public/ $pubLoc/storage
echo "........................"
sleep 1
echo "...................................................."
printf  "\n"

# #complete
read -p "What??? It is complete now?. emm. "