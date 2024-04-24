#!/bin/bash

# Function to clear the screen and reset cursor position
clear_screen() {
    printf '\e[2J\e[H'
}

# Function to display the progress bar and step message
progressbar() {
    local width=50
    local percent=$1
    local complete=$((percent * width / 100))
    local remaining=$((width - complete))
    local step_message=$2  # Step message provided as argument

    clear_screen
    printf '\e[21;20H' #change cursor position
    echo "Step: $step_message"
    printf '\e[25;15H'
    echo -ne "["
    printf "%${complete}s" | tr ' ' '='
    printf "%${remaining}s" | tr ' ' '.'
    echo -ne "] $percent%\r"
}

change_dns() {
    local dns_server=$1
    local step_message="Changing DNS to $dns_server"

    echo "nameserver $dns_server" > /etc/resolv.conf
    cat /etc/resolv.conf

    clear_screen

    printf '\e[21;25H'
    echo "DNS changed to $dns_server"
    echo " "
}

download() {
    local timeout=$1
    local file_url=$2
    local filename=$3
    local step_message="measuring $filename speed"

    timeout $timeout wget -q -O "/tmp/$filename" --no-dns-cache "$file_url"
    for ((i = 0; i <= 100; i+=20)); do

        progressbar $i "$step_message"
        sleep 1
    done
    echo  ""
}

download_speed() {
    local filename=$1

    du -sh "/tmp/$filename" >> database
    rm "/tmp/$filename"
    sleep 1
}


touch database
cp /etc/resolv.conf /etc/resolv.conf.backup

for dns_server in $dns; do
    change_dns "$dns_server"
    download $timeout "$file_url" "$dns_server"
    download_speed "$dns_server"
done

clear_screen
echo '*********************'
echo "Best DNS server is $(sort -rn database | head -1 | cut -d'/' -f3)"
echo '*********************'
rm database
cat /etc/resolv.conf.backup > /etc/resolv.conf

rm /etc/resolv.conf.backup
echo "Script completed!"

