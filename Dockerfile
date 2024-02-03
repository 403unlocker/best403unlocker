FROM ubuntu:20.04
############################### dns provider's sites ###############################
####https://www.publicdns.xyz/
#########################
#https://shecan.ir/
#178.22.122.100 185.51.200.2
#########################
#https://server.ir/dns-proxy/
#192.104.158.78 194.104.158.48
#########################
#https://hostiran.net/landing/proxy
#172.29.0.100 172.29.2.100
#########################
#https://electrotm.org/
#78.157.42.101 78.157.42.100
#########################
#https://403.online/download
#10.202.10.202 10.202.10.102
#########################
#https://begzar.ir/
#185.55.226.26 185.55.225.25
#https://radar.game/#/dns
#10.202.10.10 10.202.10.11
#########################
#https://server.ir/dns-proxy/
#?????
#########################
#https://vanillapp.ir/
#????
#########################
#https://www.quad9.net/
#9.9.9.9
#########################
#https://developers.google.com/speed/public-dns
#8.8.8.8 8.8.4.4
#########################
#https://developers.cloudflare.com/1.1.1.1/ip-addresses/
#1.1.1.1 1.0.0.1
#########################
#https://dnspro.ir/
#194.26.21.21 194.26.21.26
#########################
#
#
#########################

env file_url="https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-16.8.0-ce.0.el7.x86_64.rpm/download.rpm"
env dns="178.22.122.100 185.51.200.2 192.104.158.78 194.104.158.48 172.29.0.100 172.29.2.100 78.157.42.101 78.157.42.100 10.202.10.202 10.202.10.102 185.55.226.26 185.55.225.25 10.202.10.10 10.202.10.11 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1 1.0.0.1 194.26.21.21 194.26.21.26"
env timeout="10s"

run apt-get update && apt-get -y install wget 
ADD bash.sh . 
entrypoint ["bash","bash.sh"]
