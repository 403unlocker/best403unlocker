#!/bin/bash

# Function to display the main menu
main_menu() {
    choice=$(whiptail --title "Best403Unlcoker TUI" --menu "Choose an option:" 15 60 4 \
    "Run DNS analyzer" "find the most speedful dns" \
    "Save file" "Downlaod file with best dns" \
    "Advance setting" "change configuration" \
    "Exit" "Exit the program" \
    3>&1 1>&2 2>&3)

    case "$choice" in
        "Run DNS analyzer")
            view_status
            ;;
        "Save file")
            connect_network
            ;;
        "Advance setting")
            disconnect_network
            ;;
        "Exit")
            exit
            ;;
        *)
            ;;
    esac
}

# Function to view network status
view_status() {
	  docker run --env-file .env armantaherighaletaki/best403unlocker | tee log.txt 2>&1 
	DNS=$(grep best log.txt| cut -d' ' -f5 )

    whiptail --title "DNS analyzer" --msgbox "Best DNS:\n$DNS" 15 60
}

# Function to connect to a network
connect_network() {
    ssid=$(whiptail --title "Download file" --inputbox "Enter the SSID of the network:" 10 60 3>&1 1>&2 2>&3)
    nmcli device wifi connect "$ssid"
    whiptail --title "Connection Status" --msgbox "Connecting to $ssid..." 10 60
}

# Function to disconnect from a network
disconnect_network() {
    nmcli connection down "$(nmcli -t -f NAME connection show --active)"
    whiptail --title "Disconnect Status" --msgbox "Disconnected from the network." 10 60
}

# Main function
main() {
    while true; do
        main_menu
    done
}

# Main execution
main

