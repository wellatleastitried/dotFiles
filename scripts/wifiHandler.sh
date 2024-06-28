#!/bin/bash

connect_to_network() {
    local ssid="$1"
    nmcli device wifi connect "$ssid" > /dev/null 2>&1
}
connect_to_pp_network() {
    local ssid="$1"
    local password="$2"
    nmcli device wifi connect "$ssid" password "$password" > /dev/null 2>&1
}
echo "Searching for wireless networks..."
IFS=$'\n'
ssids=($(nmcli -t -f SSID dev wifi | sort | uniq))
printf "\nThese are the networks that were found:\n"
for (( i=0; i<${#ssids[@]}; i++ )); do
    echo "[$(($i + 1))] ${ssids[i]}"
done
printf "\n"
read -p "Enter the number next to the network you would like to connect to: " choice
if [[ $choice =~ ^[0-9]+$ ]] && (( choice >= 1)) && (( choice <= ${#ssids[@]} )); then
    selected_network="${ssids[choice - 1]}"
    echo "You selected: $selected_network"
else
    echo "That was not a valid number, exiting..."
    exit 1
fi
printf "\nTrying to connect to %s now...\n" "$selected_network"
if connect_to_network "$selected_network"; then
    echo "Connection to $selected_network established!"
else
    echo "Failed to connect to $selected_network, it may require a password."
    read -p "Enter the password here: " password
    if [[ -z "$password" ]]; then
        echo "No password entered: exiting now..."
    else
        printf "\nAttempting to reconnect with password...\n"
        if ! connect_to_pp_network "$selected_network" "$password"; then
            echo "Unable to connect to $selected_network"
        fi
    fi
fi