<!-- ABOUT THE PROJECT -->

## About best403unlocker

I had so many challenges in choosing the best DNS sni proxy server that fits my internet service provider so I developed an script that tests the speed of the DNSes so I won't waste my time on finding the best DNS server.



<!-- GETTING STARTED -->

## Best403Unlocker TUI

Best403Unlocker TUI is a bash script-based Text User Interface (TUI) designed to help users find the fastest DNS servers and download files using the optimal DNS.

![TUI](https://github.com/Kishmiish/best403unlocker/assets/65231756/4bb9778f-8c52-44b4-9128-928eda29594f)

## Features

- **DNS Analyzer**: Identify the fastest DNS servers and optionally set your system to use them.
- **File Downloader**: Download files with optimized DNS settings to ensure the fastest possible download speeds.

## Prerequisites

- whiptail:
    ```bash
    sudo apt-get install whiptail
    ```

## Getting Started with TUI

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/ArmanTaheriGhaleTaki/best403unlocker.git
   cd best403unlocker
   ```

### Running the Script

Execute the script:
```bash
bash main.sh
```

## Usage

When you run the script, a menu will appear with the following options:

- **Run DNS analyzer**: Finds the most efficient DNS server for your network.
- **Save file**: Downloads a file using the best DNS server.
- **Advance setting**: Access additional configuration options.
- **Exit**: Exit the program.



### DNS Analyzer

1. Select "Run DNS analyzer" from the main menu.
2. Enter the URL of the file you want to use for testing.
3. Choose whether to run the analysis using Docker (recommended) or directly on the system.
4. The script will find the best DNS server and optionally set your system to use it.

### File Downloader

1. Select "Save file" from the main menu.
2. Enter the URL of the file you want to download.
3. Choose the location to save the downloaded file.
4. Select whether to run the download using Docker (recommended) or directly on the system.
5. The script will configure your system to use the best DNS server and download the file.

## Getting Started with CLI

You can use this script with **docker** or run in **baremetal**   

## Baremetal
![output](https://github.com/ArmanTaheriGhaleTaki/speed-test-dns/assets/88885103/d83c954e-5f3c-434e-ae4b-f119d69a4220)   

Also you can run this script on **baremetal** with **sudo** privilege
```sh
wget -c https://raw.githubusercontent.com/ArmanTaheriGhaleTaki/best403unlocker/main/bash.sh && sudo bash bash.sh
```

## Docker

You only need **docker** installed and you can edit variables in [.env](https://github.com/ArmanTaheriGhaleTaki/best403unlocker/blob/main/.env) for your needs.

```sh
git clone --depth 1 https://github.com/ArmanTaheriGhaleTaki/best403unlocker/ && cd best403unlocker && docker build -t best403unlocker . && docker run --env-file .env best403unlocker
```

or you can use built image uploaded in dockerhub  
 _for that case you need to use [.env](https://github.com/ArmanTaheriGhaleTaki/best403unlocker/blob/main/.env) at run time_

```sh
wget -c https://raw.githubusercontent.com/ArmanTaheriGhaleTaki/best403unlocker/main/.env && docker run --env-file .env armantaherighaletaki/best403unlocker
```


## credit 
thank [AKishmiish](https://github.com/Kishmiish) for adding TUI to this projcet
## Contact

My social media - [@armondy🙄](https://twitter.com/taherighaletaki) - armantahery1381@gmail.com

Project Link: [best403unlocker](https://github.com/ArmanTaheriGhaleTaki/best403unlocker)
