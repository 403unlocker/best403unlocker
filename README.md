<!-- ABOUT THE PROJECT -->

## About best403unlocker

I had so many challenges in choosing the best DNS sni proxy server that fits my internet service provider so I developed an script that tests the speed of the DNSes so I won't waste my time on finding the best DNS server.

![output](https://github.com/ArmanTaheriGhaleTaki/speed-test-dns/assets/88885103/d83c954e-5f3c-434e-ae4b-f119d69a4220)

<!-- GETTING STARTED -->

## Getting Started

You can use this script with **docker** or run in **baremetal**   

## Baremetal
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

## Contact

My social media - [@armondy🙄](https://twitter.com/taherighaletaki) - armantahery1381@gmail.com

Project Link: [best403unlocker](https://github.com/ArmanTaheriGhaleTaki/best403unlocker)
