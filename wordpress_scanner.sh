#!/bin/bash

# Colors for beautiful output
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Function to display a banner
banner() {
    echo -e "${CYAN}"
    figlet -f slant "WP Scanner"
    figlet -f small "By Ayush"
    echo -e "${RESET}"
}

# Function to fetch site information using WhatWeb
site_info() {
    echo -e "${GREEN}=== Site Information ===${RESET}"

    echo -e "${BLUE}[+] WhatWeb Detailed Information:${RESET}"
    whatweb -v -a 3 "$URL" | sed 's/, /\n/g' || echo "[!] WhatWeb failed."
    echo
}

# Function to perform port scanning using nmap
port_scanning() {
    echo -e "${BLUE}=== Port Scanning ===${RESET}"

    # Convert domain to IP address
    IP_ADDRESS=$(dig +short "$DOMAIN" | head -n 1)
    if [[ -z "$IP_ADDRESS" ]]; then
        echo -e "${RED}[!] Failed to resolve IP address for $DOMAIN${RESET}"
        return
    fi

    echo -e "${YELLOW}[+] Scanning IP Address: $IP_ADDRESS${RESET}"
    nmap -F "$IP_ADDRESS" | grep -E 'open|filtered' || echo "[!] No open ports found."
    echo
}

# Function to perform WordPress vulnerability scanning using wpscan
wordpress_scan() {
    echo -e "${RED}=== WordPress Vulnerability Scan ===${RESET}"
    wpscan --url "$URL" --api-token YOUR_WPSCAN_API_TOKEN || echo "[!] WPScan failed. Ensure the URL is correct and WPScan is installed."
    echo
}

# Input Validation
validate_input() {
    if [[ "$URL" != http*://* ]]; then
        echo -e "${RED}[!] Invalid URL. Use the format: http(s)://example.com${RESET}"
        exit 1
    fi
    DOMAIN=$(echo "$URL" | awk -F/ '{print $3}') # Extract domain from URL
}

# Main function
main() {
    banner

    # Validate input
    validate_input

    # Perform scans
    site_info
    port_scanning
    wordpress_scan

    echo -e "${YELLOW}Scan completed for $URL${RESET}"
}

# Read URL from user input
URL=$1
if [[ -z "$URL" ]]; then
    echo -e "${RED}Usage: $0 <website_url>${RESET}"
    exit 1
fi

main