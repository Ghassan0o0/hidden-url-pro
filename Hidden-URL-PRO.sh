#!/bin/bash
clear
url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Please use http or https.\e[0m"
            exit 1
        fi
    fi
}

echo -e "\e[30;48;5;82m #     #                               #                         \e[0m"
echo -e "\e[30;48;5;82m #     # # #####  #####  ###### #    # #       # #    # #    #   \e[0m"
echo -e "\e[30;48;5;82m #     # # #    # #    # #      ##   # #       # ##   # #   #    \e[0m"
echo -e "\e[30;48;5;82m ####### # #    # #    # #####  # #  # #       # # #  # ####     \e[0m"
echo -e "\e[30;48;5;82m #     # # #    # #    # #      #  # # #       # #  # # #  #     \e[0m"
echo -e "\e[30;48;5;82m #     # # #    # #    # #      #   ## #       # #   ## #   #    \e[0m"
echo -e "\e[30;48;5;82m #     # # #####  #####  ###### #    # ####### # #    # #    #   PRO edition\e[0m \n"
echo -e "\e[40;38;5;82m HiddenLink(pro)  V.3.2\e[0m"
echo -e "\e[30;48;5;82m    Copyright(c)2024-2025    Ghassan Melhem \e[0m \n\n"
echo "Phishing URL"

echo "Paste Phishing URL here (with http or https): "
read phish
url_checker $phish
sleep 1
echo "Processing Your URL"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo "Hide URL"
echo 'Enter the domain to mask the Phishing URL (with http or https), ex: https://google.com, http
://anything.org) :'
echo -en "=> "
read mask
url_checker $mask
echo -e '\nType social engineering words:(like free-money, gta6-for-mobile)'
echo -e "\e[31mDon't use space just use '-' between social engineering words\e[0m"
echo -e "\e[31mPress enter to skip this step\e[0m"
echo -en "=>"
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m[!] No words.\e[0m"
echo -e "\nGenerating URL...\n"
final=$mask@$shorter
echo -e "Here is the URL: ${final}"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "\e[31m[!] Invalid words. Please avoid space.\e[0m"
echo -e "\nGenerating URL...\n"
final=$mask@$shorter
echo -e "Here is URL:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGenerating URL...\n"
final=$mask-$words@$shorter
echo -e "Here is the URL:\e[32m ${final} \e[0m\n"
