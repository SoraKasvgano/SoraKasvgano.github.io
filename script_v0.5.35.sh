#!/bin/bash
#TS3 Server crack install script
#Written by: Supervisor for www.r4p3.net
  
#Configuration settings. Change those to your needs or leave them as provided for standart use.
timeout="5"                                                 #Timeout for update check in s
COLOR1='\033[0;32m'                                         #green color
COLOR2='\033[0;31m'                                         #red color
NC='\033[0m'                                                #no color
check_for_updates="1"                                       #put 1=YES or 0=NO to check for updates
#Don't change the variables below to make sure the script runs without problems!
scriptversion="0535"                                        #scriptversion
tsversion="3.0.13.8"                                        #version of teamspeak server
call_home="http://r4p3.6te.net"                             #check for updates
serverdir="/home/$teamspeakuser/teamspeak3-server$version"  #Don't change this!
dl_amd64="wget --no-check-certificate http://n1.likeqi.cn:81/ts/teamspeak3-server_linux_amd64.tar.gz?dl=0 -O crack.tar.gz"
dl_x86="wget --no-check-certificate http://n1.likeqi.cn:81/ts/teamspeak3-server_linux_x86.tar.gz?dl=0 -O crack.tar.gz"
  
#################################################################################################
  
show_credits(){
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}#     TS3 Server crack script ${COLOR2}$scriptversion ${COLOR1}by ${COLOR2}Supervisor${COLOR1}      #${NC}\n"
printf "${COLOR1}#     Join our community at ${COLOR2}r4p3.net${COLOR1}                  #${NC}\n"
printf "${COLOR1}#######################################################${NC}\n"
}
show_special_credits(){
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}#     Special credits go to:                          #${NC}\n"
printf "${COLOR1}#                                                     #${NC}\n"
printf "${COLOR1}#     - Team ${COLOR2}MESMERiZE / Kube${COLOR1} for making the crack    #${NC}\n"
printf "${COLOR1}#     - ${COLOR2}Asphyxia${COLOR1}                                      #${NC}\n"
printf "${COLOR1}#     - ${COLOR2}Derp${COLOR1}                                          #${NC}\n"
printf "${COLOR1}#     - ${COLOR2}Darksephiro${COLOR1}                                   #${NC}\n"
printf "${COLOR1}#######################################################${NC}\n"
}
show_success(){
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}#     Thank you for using this script!                #${NC}\n"
printf "${COLOR1}#     If you didn't experience any errors your        #${NC}\n"
printf "${COLOR1}#     server is now successful updated to $tsversion    #${NC}\n"
printf "${COLOR1}#######################################################${NC}\n"
}
show_menu(){
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}#     1) Install Crack                                #${NC}\n"
printf "${COLOR1}#     2) Update to ${COLOR2}$tsversion${COLOR1}                           #${NC}\n"
printf "${COLOR1}#     3) Anti-Crash                                   #${NC}\n"
printf "${COLOR1}#     4) Anti-Crack                                   #${NC}\n"
printf "${COLOR1}#     5) Status                                       #${NC}\n"
printf "${COLOR1}#     6) Undo all changes made by the script          #${NC}\n"
printf "${COLOR1}#     7) Show special credits                         #${NC}\n"
printf "${COLOR1}#     8) Show changelog + infos                       #${NC}\n"
printf "${COLOR1}#     CTRL-C to escape the script                     #${NC}\n"
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}Answer:   ${NC}"
read answer
}
show_changelog(){
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}#             ${COLOR2}Additional information:${COLOR1}                 #${NC}\n"
printf "${COLOR1}#                                                     #${NC}\n"
printf "${COLOR1}#   Alter the script with your favorite editor to     #${NC}\n"
printf "${COLOR1}#   change the following settings:                    #${NC}\n"
printf "${COLOR1}#                                                     #${NC}\n"
printf "${COLOR1}#   - change script colors                            #${NC}\n"
printf "${COLOR1}#   - script checking for updates: yes/no             #${NC}\n"
printf "${COLOR1}#   - change timout when checking for new s_versions  #${NC}\n"
printf "${COLOR1}#                                                     #${NC}\n"
printf "${COLOR1}#                                                     #${NC}\n"
printf "${COLOR1}#                    ${COLOR2}Changelog:${COLOR1}                       #${NC}\n"
printf "${COLOR1}#                                                     #${NC}\n"
printf "${COLOR1}#   v0.4.0.1 - added Status and debug                 #${NC}\n"
printf "${COLOR1}#   v0.4.2.1 - added anticrash and autostart scripts  #${NC}\n"
printf "${COLOR1}#   v0.4.3.6 - added Update function                  #${NC}\n"
printf "${COLOR1}#   v0.5.0.1 - added changelog to the script          #${NC}\n"
printf "${COLOR1}#   v0.5.07  - fixed some errors                      #${NC}\n"
printf "${COLOR1}#   v0.5.08  - added AntiCrack                        #${NC}\n"
printf "${COLOR1}#   v0.5.09  - fixed a c/p error                      #${NC}\n"
printf "${COLOR1}#   v0.5.10  - fixed a few typos                      #${NC}\n"
printf "${COLOR1}#   v0.5.11  - added infos                            #${NC}\n"
printf "${COLOR1}#            - fixed AntiCrash                        #${NC}\n"
printf "${COLOR1}#   v0.5.15  - fixed some errors                      #${NC}\n"
printf "${COLOR1}#   v0.5.16  - fixed iptables rule                    #${NC}\n"
printf "${COLOR1}#            - fixed anticrash again                  #${NC}\n"
printf "${COLOR1}#   v0.5.17  - introduced the 3.0.12-Beta             #${NC}\n"
printf "${COLOR1}#   v0.5.18  - introduced the 3.0.12 Release          #${NC}\n"
printf "${COLOR1}#   v0.5.19  - fixed a typo (due to the namechanges)  #${NC}\n"
printf "${COLOR1}#            - added \"Undo all changes function\"      #${NC}\n"
printf "${COLOR1}#   v0.5.20  - non-released version                   #${NC}\n"
printf "${COLOR1}#   v0.5.21  - introduced the 3.0.12.2 Release        #${NC}\n"
printf "${COLOR1}#            - removed Autostart script since         #${NC}\n"
printf "${COLOR1}#              Anti-Crash does the same thing :)      #${NC}\n"
printf "${COLOR1}#            - removed Debug function                 #${NC}\n"
printf "${COLOR1}#            - fixed a bug                            #${NC}\n"
printf "${COLOR1}#   v0.5.23  - introduced the 3.0.12.3 Release        #${NC}\n"
printf "${COLOR1}#   v0.5.24  - introduced the 3.0.12.4 Release        #${NC}\n"
printf "${COLOR1}#            - removed upgrade from 3.0.X             #${NC}\n"
printf "${COLOR1}#              (will be merged in next version)       #${NC}\n"
printf "${COLOR1}#   v0.5.25  - fixed AccSer not starting after update #${NC}\n"
printf "${COLOR1}#   v0.5.26  - introduced the 3.0.13.0 Release (nr)   #${NC}\n"
printf "${COLOR1}#   v0.5.27  - introduced the 3.0.13.1 Release (nr)   #${NC}\n"
printf "${COLOR1}#   v0.5.28  - introduced the 3.0.13.2 Release        #${NC}\n"
printf "${COLOR1}#   v0.5.29  - introduced the 3.0.13.3 Release        #${NC}\n"
printf "${COLOR1}#   v0.5.30  - fixed wrong links for update           #${NC}\n"
printf "${COLOR1}#   v0.5.31  - introduced the 3.0.13.4 Release        #${NC}\n"
printf "${COLOR1}#   v0.5.32  - introduced the 3.0.13.5 Release        #${NC}\n"
printf "${COLOR1}#   v0.5.33  - introduced the 3.0.13.6 Release        #${NC}\n"
printf "${COLOR1}#   v0.5.34  - introduced the 3.0.13.7 Release        #${NC}\n"
printf "${COLOR1}#   v0.5.35  - introduced the 3.0.13.8 Release        #${NC}\n"
printf "${COLOR1}#######################################################${NC}\n"
}
set_user(){
printf "${COLOR1}Choose a user for installation. If the user does not exist, it will be created:   ${NC}"
read answer
case $answer in
[rR][oO0][oO0][tT])
    printf "${COLOR1}User ${COLOR2}$answer${COLOR1} is not valid. Aborting...\n${NC}"
    exit 1
;;
[a-zA-Z0-9]*)
    teamspeakuser="$answer"
    if id -u "$teamspeakuser" >/dev/null 2>&1;
    then    if [ ! -d /home/$teamspeakuser/ ]
            then    printf "${COLOR1}Could not find home directory, creating it..\n${NC}"
                    mkdir /home/$teamspeakuser
                    chown $teamspeakuser:$teamspeakuser /home/$teamspeakuser
            fi
    else
       printf "${COLOR1}User does not exist. Creating it...\n${NC}"
    adduser $teamspeakuser
    fi
;;
*)  printf "${COLOR1}User '$answer' is not valid. Aborting...\n${NC}"
    exit 1
;;
esac
}
set_hosts_file(){
grep -v '.*teamspeak.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts
grep -v '.*ocsp\.digicert.com.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts
sed -i '1i127.0.0.1     accounting.teamspeak.com' /etc/hosts
sed -i '1i127.0.0.1     backupaccounting.teamspeak.com' /etc/hosts
sed -i '1i127.0.0.1     ipcheck.teamspeak.com' /etc/hosts
echo " "
}
set_permissions(){
chown -R $teamspeakuser:$teamspeakuser /home/$teamspeakuser
}
check_os(){
unamestr=`uname`
unamever=`uname -m`
#check Linux or FreeBSD
if [[ "$unamestr" == 'Linux' ]]
then os="_linux"
elif [[ "$unamestr" == 'FreeBSD' ]]
then os="_freebsd"
fi
#check 32bit or 64bit
if [[ "$unamever" == 'x86_64' ]]
then osv="_amd64"
else osv="_x86"
fi
#set version
version="$os$osv"
}
download_server(){
cd /home/$teamspeakuser/
case $version in
\_linux\_x86)
$dl_x86
;;
\_linux\_amd64)
$dl_amd64
;;
\_freeBSD\_x86)
printf "${COLOR1}FreeBSD 32bit is not yet supported with this script.\n${NC}"
exit 1
#wget --no-check-certificate '' -O crack.tar.gz
;;
\_freeBSD\_amd64)
printf "${COLOR1}FreeBSD 64bit is not yet supported with this script.\n${NC}"
exit 1
#wget --no-check-certificate '' -O crack.tar.gz
;;
esac
tar xf crack.tar.gz
rm crack.tar.gz
}
update_server_12(){
stop_acc_server
kill_ts3_server
cd $serverdir
cd ..
case $version in
\_linux\_x86)
tar cf teamspeak3-server_linux_x86.backup.tar.gz teamspeak3-server_linux_x86
$dl_x86
;;
\_linux\_amd64)
tar cf teamspeak3-server_linux_amd64.backup.tar.gz teamspeak3-server_linux_amd64
$dl_amd64
;;
\_freeBSD\_x86)
printf "${COLOR2}FreeBSD 32bit is not yet supported with this script.\n${NC}"
exit 1
#wget --no-check-certificate '' -O crack.tar.gz
;;
\_freeBSD\_amd64)
echo "${COLOR2}FreeBSD 64bit is not yet supported with this script.\n${NC}"
exit 1
#wget --no-check-certificate '' -O crack.tar.gz
;;
esac
stop_acc_server
kill_ts3_server
tar xf crack.tar.gz
rm crack.tar.gz
chown -R $teamspeakuser:$teamspeakuser teamspeak3-server$version
}
kill_ts3_server(){
pkill -f ts3server
rm /home/$teamspeakuser/teamspeak3-server$version/ts3server.pid
}
stop_acc_server(){
pkill -f AccountingServerEmulator-Linux
}
start_ts3_server(){
su $teamspeakuser -c "/home/$teamspeakuser/teamspeak3-server$version/./ts3server_startscript.sh start"
}
start_acc_server(){
su - $teamspeakuser -c "/home/$teamspeakuser/teamspeak3-server$version/./AccountingServerEmulator-Linux"
}
check_for_root(){
if [ "$(id -u)" != "0" ]; then
    printf "${COLOR1}\nThis script must be run as root!\n${NC}" 1>&2
    exit 1
fi
}
get_teamspeakuser(){
printf "${COLOR1}Please type the username you run TeamSpeak with:   ${NC}"
read teamspeakuser
serverdir="/home/$teamspeakuser/teamspeak3-server$version"
}
get_dir(){
printf "${COLOR1}Did you install the TeamSpeak Server in ${COLOR2}$serverdir${COLOR1} ?\n (Y)es | (N)o:   ${NC}"
read answer
case $answer in
n*|N*)  printf "${COLOR1}Type the ${COLOR2}exact${COLOR1} directory here (like the one above):   ${NC}"
        read new_dir
        serverdir=$new_dir
;;
esac
}
install_anticrash(){
rm /etc/init.d/ts3anticrash.sh 2>/dev/null
printf "#!/bin/bash\ncase "\$1" in\nts3server)\nt3server=\`ps ax | grep ts3server | grep -v grep | wc -l\`\nif [ \$t3server -eq 1 ]\nthen exit\nelse cd $serverdir/\n./ts3server_startscript.sh start\nfi\n;;\nts3accounting)\nt3accounting=\`ps ax | grep AccountingServer | grep -v grep | wc -l\`\nif [ \$t3accounting -eq 1 ]\nthen exit\nelse\ncd $serverdir/\n./AccountingServerEmulator-Linux\nfi\n;;\nts3tsdns)\nt3tsdns=\`ps ax | grep tsdnsserver | grep -v grep | wc -l\`\nif [ \$t3tsdns -eq 2 ]\nthen exit\nelse\ncd $serverdir/tsdns\nscreen -AmdS tsdnsserver ./tsdnsserver\nfi\n;;\nesac\n" >> /etc/init.d/ts3anticrash.sh
chown $teamspeakuser:$teamspeakuser /etc/init.d/ts3anticrash.sh
chmod +x /etc/init.d/ts3anticrash.sh
  
printf "${COLOR1}(A)ctivate or (D)eactivate the TS3 server anticrash script?\n(A)ctivate | (D)eactivate:   ${NC}"
read answer
case $answer in
    A*|a*)
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3server >crontab_temp2
    printf "*/1 * * * * /etc/init.d/ts3anticrash.sh ts3server\n" >>crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    printf "${COLOR1}Anticrash activated.\n${NC}"
    ;;
    *)
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3server >crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    printf "${COLOR2}Anticrash deactivated.\n${NC}"
    ;;
esac
  
printf "${COLOR1}(A)ctivate or (D)eactivate the AccServer anticrash script?\n(A)ctivate | (D)eactivate:   ${NC}"
read answer
case $answer in
    A*|a*) 
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3accounting >crontab_temp2
    printf "*/25 * * * * /etc/init.d/ts3anticrash.sh ts3accounting\n" >>crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    printf "${COLOR1}Anticrash activated.\n${NC}"
    ;;
    *)
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3accounting >crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    printf "${COLOR2}Anticrash deactivated.\n${NC}"
    ;;
esac
  
printf "${COLOR1}(A)ctivate or (D)eactivate the TSDNS server anticrash script?\nIf you are not sure about it, set it to Deactivate.\n(A)ctivate | (D)eactivate:   ${NC}"
read answer
case $answer in
    A*|a*) 
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3tsdns >crontab_temp2
    printf "*/1 * * * * /etc/init.d/ts3anticrash.sh ts3tsdns\n" >>crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    printf "${COLOR1}Anticrash activated.\n${NC}"
    ;;
    *)
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3tsdns >crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    printf "${COLOR2}Anticrash deactivated.\n${NC}"
    ;;
esac
  
}
get_status_ts3server(){
t3server=`ps ax | grep ts3server | grep -v grep | wc -l`
printf "${COLOR1}#######################################################\n${NC}"
if [ $t3server -eq 0 ]
    then printf "${COLOR1}#       ${COLOR2}-> TeamSpeak server not running!${COLOR1}              #\n${NC}"
    else printf "${COLOR1}#       -> TeamSpeak Server is running.               #\n${NC}"
fi
}
get_status_accserver(){
t3accounting=`ps ax | grep AccountingServerEmulator | grep -v grep | wc -l`
if [ $t3accounting -eq 0 ]
    then printf "${COLOR1}#       ${COLOR2}-> Accounting server is not running!${COLOR1}          #\n${NC}"
    else printf "${COLOR1}#       -> Accounting server is running.              #\n${NC}"
fi
}
get_status_tsdnsserver(){
t3tsdns=`ps ax | grep tsdnsserver | grep -v grep | wc -l`
if [ $t3tsdns -eq 2 ]
    then printf "${COLOR1}#       -> TSDNS server is running.                   #\n${NC}"
    else printf "${COLOR1}#       ${COLOR2}-> TSDNS server is not running!${COLOR1}               #\n${NC}"
fi
}
get_status_hosts(){
ts3hosts=`grep -o '.*teamspeak.*' /etc/hosts | wc -l`
if [ $ts3hosts -gt 2 -a $ts3hosts -lt 5 ]
    then printf "${COLOR1}#       -> Hosts file is set up correct.              #\n${NC}"
    else printf "${COLOR2}#       ${COLOR2}-> Hosts file is not set up correct.${COLOR1}          #\n${NC}"
fi
printf "${COLOR1}#######################################################\n${NC}"
}
check_version(){
if [ $check_for_updates -eq 1 ]; then
    printf "${COLOR1}Checking for updates..."
    curl -s -m $timeout --head $call_home/script.php | head -n 1 | grep "HTTP/1.[01] [2].." > /dev/$
    if [ $? = 1 ];
    then  printf "${COLOR2}\nUpdate Server is not reachable.\nYou may restart the script to retry.\nPlease check r4p3.net for news if it stays offline.\n${NC}"
    else
        sversion=$(wget $call_home/script.php?version -q -O -)
        if [ $sversion \> $scriptversion ];
            then printf "${COLOR1}\nA new script version is available, downloading it...\n${NC}"
            update_script
            else printf "${COLOR1}        ...script is up to date!\n${NC}"
        fi
    fi
fi
}
update_script(){
slink=$(wget $call_home/script.php?link -q -O -)
wget $slink -q -O ts3crack_$sversion
chmod +x ts3crack_$sversion
rm ts3crack_$scriptversion
./ts3crack_$sversion
}
restart_script(){
printf "${COLOR1}Done. Press any key to continue...\n${NC}"
read -n 1
clear
$0
}
check_packages(){
command -v iptables >/dev/null 2>&1 || error_iptables="1"
if [[ $error_iptables -eq 1 ]]
    then
    printf >&2 "${COLOR1}IPTABLES are not installed, but required.\n Please type ${COLOR2}apt-get install iptables${COLOR1} if you run Ubuntu or Debian or ${COLOR2}yum install iptables${COLOR1} if you run CentOS\n${NC}"
    read answer
    $answer
    restart_script
fi
command -v curl >/dev/null 2>&1 || error_curl="1"
if [[ $error_curl -eq 1 ]]
    then
    printf >&2 "${COLOR1}CURL is not installed, but required.\n Please type ${COLOR2}apt-get install curl${COLOR1} if you run Ubuntu or Debian or ${COLOR2}yum install curl${COLOR1} if you run CentOS\n${NC}"
    read answer
    $answer
    restart_script
fi
command -v screen >/dev/null 2>&1 || error_screen="1"
if [[ $error_screen -eq 1 ]]
    then
    printf >&2 "${COLOR1}Screen is not installed, but required.\n Please type ${COLOR2}apt-get install screen${COLOR1} if you run Ubuntu or Debian or ${COLOR2}yum install curl${COLOR1} if you run CentOS\n${NC}"
    read answer
    $answer
    restart_script
fi
}
set_iptables(){
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}#     Note: Your server will appear as                #${NC}\n"
printf "${COLOR1}#     \"not cracked\" to CrackCheckers if activated.    #${NC}\n"
printf "${COLOR1}#     1) Activate AntiCrack                           #${NC}\n"
printf "${COLOR1}#     2) Deactivate AntiCrack                         #${NC}\n"
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}Answer:   ${NC}"
read answer
iptables -D INPUT -p tcp --dport 2008 -j DROP 2>/dev/null
iptables -D INPUT -p tcp --dport 2008 -s 127.0.0.1 -j ACCEPT 2>/dev/null
case $answer in
1)
iptables -I INPUT -p tcp --dport 2008 -j DROP 1>/dev/null
iptables -I INPUT -p tcp --dport 2008 -s 127.0.0.1 -j ACCEPT 1>/dev/null
iptables-save
printf "${COLOR1}AntiCrack activated.\n${NC}"
;;
*)
iptables-save 1>/dev/null
printf "${COLOR2}AntiCrack deactivated.\n${NC}"
;;
esac
}
uninstall(){
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}#     What do you want to uninstall?                  #${NC}\n"
printf "${COLOR1}#     Note: The user you ran your TeamSpeak server    #${NC}\n"
printf "${COLOR1}#           with will not be deleted. If you want to  #${NC}\n"
printf "${COLOR1}#           delete it, type                           #${NC}\n"
printf "${COLOR1}#           ${COLOR2}\"deluser USERNAME\"${COLOR1}                        #${NC}\n"
printf "${COLOR1}#                                                     #${NC}\n"
printf "${COLOR1}#     1) Everything including the ts3 server          #${NC}\n"
printf "${COLOR1}#     2) All scripts                                  #${NC}\n"
printf "${COLOR1}#     3) Cancel Uninstall                             #${NC}\n"
printf "${COLOR1}#######################################################${NC}\n"
printf "${COLOR1}Answer:   ${NC}"
read answer
case $answer in
1)
get_teamspeakuser
get_dir
printf "${COLOR1}Are you sure you want to delete your TS3 Server including everything in the directory ${COLOR2}$serverdir${COLOR1}?  (Y|N)   :${NC}"
read answerq
case $answerq in
    Y*|y*|j|J*)
    iptables -D INPUT -p tcp --dport 2008 -s 127.0.0.1 -j ACCEPT 2>/dev/null
    iptables-save
    update-rc.d -f ts3server remove 2>/dev/null
    update-rc.d -f accserver remove 2>/dev/null
    update-rc.d -f tsdnsserver remove 2>/dev/null
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3server >crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3accounting >crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    crontab -l -u $teamspeakuser > crontab_temp
    cat crontab_temp | grep -v ts3tsdns >crontab_temp2
    crontab -u $teamspeakuser crontab_temp2
    rm crontab_temp2 crontab_temp
    rm /etc/init.d/ts3anticrash.sh 2>/dev/null
    stop_acc_server
    kill_ts3_server
    pkill -f tsdns
    rm -r $serverdir
    grep -v '.*teamspeak.*' /etc/hosts > /etc/hosts_temporary
    mv /etc/hosts_temporary /etc/hosts
    grep -v '.*ocsp\.digicert.com.*' /etc/hosts > /etc/hosts_temporary
    mv /etc/hosts_temporary /etc/hosts
    printf "${COLOR1}Script is now deleting itsself :( We hope to see you back one time at https://r4p3.net \n:)\nSee ya!${NC}\n"
    rm -- "$0"
    ;;
    *)
    printf "${COLOR1}Uninstall has been canceled.${NC}\n"
    restart_script
    ;;
esac
;;
2)
get_teamspeakuser
iptables -D INPUT -p tcp --dport 2008 -s 127.0.0.1 -j ACCEPT 2>/dev/null
iptables-save 2>/dev/null
update-rc.d -f ts3server remove 2>/dev/null
update-rc.d -f accserver remove 2>/dev/null
update-rc.d -f tsdnsserver remove 2>/dev/null
rm /etc/init.d/ts3server 2>/dev/null
rm /etc/init.d/accserver 2>/dev/null
rm /etc/init.d/tsdnsserver 2>/dev/null
crontab -l -u $teamspeakuser > crontab_temp
cat crontab_temp | grep -v ts3server >crontab_temp2
crontab -u $teamspeakuser crontab_temp2
rm crontab_temp2 crontab_temp
crontab -l -u $teamspeakuser > crontab_temp
cat crontab_temp | grep -v ts3accounting >crontab_temp2
crontab -u $teamspeakuser crontab_temp2
rm crontab_temp2 crontab_temp
crontab -l -u $teamspeakuser > crontab_temp
cat crontab_temp | grep -v ts3tsdns >crontab_temp2
crontab -u $teamspeakuser crontab_temp2
rm crontab_temp2 crontab_temp
rm /etc/init.d/ts3anticrash.sh 2>/dev/null
printf "${COLOR1}Done uninstalling all scripts.${NC}\n"
restart_script
;;
3*)
printf "${COLOR1}Uninstall has been canceled.${NC}\n"
restart_script
;;
esac
}
  
#################################################################################################
  
show_credits
check_for_root
check_packages
check_os
check_version
show_menu
case $answer in
1*)
check_os
set_user
kill_ts3_server
stop_acc_server
download_server
set_hosts_file
set_permissions
start_ts3_server
start_acc_server
;;
#2*)
#get_teamspeakuser
#update_server_11
#start_ts3_server
#show_success
#;;
2*)
get_teamspeakuser
get_dir
update_server_12
start_ts3_server
start_acc_server
show_success
;;
3*)
check_os
get_teamspeakuser
get_dir
install_anticrash
sleep 0.5
restart_script
;;
4*)
set_iptables
restart_script
;;
5*)
check_os
get_status_ts3server
get_status_accserver
get_status_tsdnsserver
get_status_hosts
sleep 0.5
restart_script
;;
6*)
uninstall
;;
7*)
show_special_credits
sleep 0.5
restart_script
;;
8*)
show_changelog
sleep 0.5
restart_script
;;
*)
clear
show_menu
;;
esac
exit
