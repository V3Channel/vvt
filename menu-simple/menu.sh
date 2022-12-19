#!/bin/bash

xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE XRAY 
if [[ $xray_service == "running" ]]; then 
   status_xray="\033[1;92m ON \e[0m"
else
   status_xray="\033[0;31m OFF \e[0m"
fi
# STATUS SERVICE NGINX 
if [[ $nginx_service == "running" ]]; then 
   status_nginx="\033[1;92m ON \e[0m"
else
   status_nginx="\033[0;31m OFF \e[0m"
fi

domain=$(cat /usr/local/etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
CITY=$(curl -s ipinfo.io/city)
WKT=$(curl -s ipinfo.io/timezone)
DATE=$(date -R | cut -d " " -f -4)
MYIP=$(curl -sS ipv4.icanhazip.com)
clear 

echo -e ""
echo -e "\033[1;92m Freemium Script >>>>> LITE DARK V3\e[0m"
echo -e "\e[35m╒═════════════════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;47;30m                        INFO SERVER                      \E[0m"
echo -e "\e[35m╘═════════════════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e " \033[1;35mOperating System\e[0m  : "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e " \033[1;35mIP Address\e[0m        : \033[1;92m$MYIP\e[0m"
echo -e " \033[1;35mService Provider\e[0m  : $ISP"
echo -e " \033[1;35mTimezone\e[0m          : $WKT"
echo -e " \033[1;35mCity\e[0m              : $CITY"
echo -e " \033[1;35mDomain\e[0m            : \033[1;92m$domain\e[0m"
echo -e " \033[1;35mDate\e[0m              : $DATE"
echo -e " \033[1;35mISP Recommend\e[0m     : Debian 11 & Ubuntu 20.04"
echo -e " \033[1;35mExpired Script\e[0m    :\033[1;92m Lifetime\e[0m"
echo -e ""
echo -e "\e[35m╒═════════════════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;47;30m         [ XRAY-CORE : ${status_xray}\033[0m\E[0;47;30m ]   [ NGINX : ${status_nginx}\033[0m\E[0;47;30m ]         \033[0m"
echo -e "\e[35m╘═════════════════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e " \033[1;92m                       LITE DARK V3                     \E[0m"
echo -e ""
echo -e "\e[35m╒═════════════════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;47;30m                        XRAY MENU                        \E[0m"
echo -e "\e[35m╘═════════════════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e " \033[1;31m[01]\033[0m \033[1;32mCreate Vmess Config\e[0m       \033[1;31m[06]\033[0m \033[1;32mInfo Port\e[0m"
echo -e " \033[1;31m[02]\033[0m \033[1;33mCreate Vless Config\e[0m       \033[1;31m[07]\033[0m \033[1;32mTheme Origin\e[0m"
echo -e " \033[1;31m[03]\033[0m \033[1;34mCreate Trojan Config\e[0m      \033[1;31m[08]\033[0m \033[1;32mTheme Simple\e[0m"
echo -e " \033[1;31m[04]\033[0m \033[1;35mChange New Xray-Core\e[0m      \033[1;31m[09]\033[0m \033[1;32mTheme Green\e[0m"
echo -e " \033[1;31m[05]\033[0m \033[1;36mChange Old Xray-Core\e[0m"
echo -e ""
echo -e "\e[35m ═════════════════════════════════════════════════════════\033[0m"
echo -e "\e[35m ═════════════════════════════════════════════════════════\033[0m"
echo -e ""
echo -e " Press X or [ Ctrl + C ] To Exit Script"
echo -e ""
read -p " Select Menu :  "  opt
echo -e ""
case $opt in
1) clear ; m-vmess ;;
2) clear ; m-vless ;;
3) clear ; m-trojan ;;
4) clear ; new ;;
5) clear ; old ;;
6) clear ; info ;;
7) clear ; wget -q -O /usr/bin/menu https://raw.githubusercontent.com/V3Channel/vvt/main/menu.sh && chmod +x /usr/bin/menu ;;
8) clear ; wget -q -O /usr/bin/menu https://raw.githubusercontent.com/V3Channel/vvt/main/menu-simple/menu.sh && chmod +x /usr/bin/menu ;;
9) clear ; wget -q -O /usr/bin/menu https://raw.githubusercontent.com/V3Channel/vvt/main/menu-green/menu.sh && chmod +x /usr/bin/menu ;;
x) exit ;;
*) echo "Wrong Key" ; sleep 0.5 ; menu ;;
esac
