WP Scanner - WordPress Vulnerability Scanner

WP Scanner is a simple yet powerful WordPress vulnerability scanner built using Linux tools. The tool combines WhatWeb, Nmap, and WPScan to provide detailed insights into the security status of WordPress websites, including the technology stack, open ports, and known vulnerabilities.

Features

WhatWeb: Collects detailed information about the website's technology stack (CMS, server, and more).

Nmap: Performs a port scan to identify open ports and potential security risks.

WPScan: Checks for WordPress-specific vulnerabilities, such as outdated plugins and themes.


Prerequisites

Ensure you have the following tools installed on your Linux system:

WhatWeb: WhatWeb GitHub

Nmap: sudo apt install nmap

WPScan: WPScan GitHub

Dig: For DNS lookup: sudo apt install dnsutils


You can install WPScan using the following command:

sudo gem install wpscan

Installation

1. Clone the repository:

git clone https://github.com/your-username/wp-scanner.git


2. Navigate to the project directory:

cd wp-scanner


3. Make the script executable:

chmod +x wordpress_scanner.sh



Usage

1. Run the script by providing a website URL:

./wordpress_scanner.sh https://example.com


2. The script will output the following:

Site Information: Technologies used on the website.

Port Scanning: Open ports on the server.

WordPress Vulnerability Scan: Detected vulnerabilities, outdated plugins, and themes.




Example:

./wordpress_scanner.sh https://example.com

Sample Output:

=== Site Information ===
[+] WhatWeb Detailed Information:
Country[United States]
HTTPServer[Apache]
PoweredBy[PHP/8.1.1]
CMS[WordPress]
Title[Example Site]

=== Port Scanning ===
[+] Scanning IP Address: 93.184.216.34
PORT      STATE SERVICE
80/tcp    open  http
443/tcp   open  https

=== WordPress Vulnerability Scan ===
[+] WordPress version: 6.3.1
[!] Vulnerable plugin found: Elementor (Version: 3.14.1)
    [>] Vulnerabilities:
        - XSS vulnerability in Elementor before 3.14.0

Contribution

Feel free to fork this repository, submit issues, or create pull requests. Contributions are always welcome to improve the tool.#
