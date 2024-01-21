#variables
#file_url="https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-16.8.0-ce.0.el7.x86_64.rpm/download.rpm"
#dns="178.22.122.100 185.51.200.2 192.104.158.78 194.104.158.48 172.29.0.100 172.29.2.100 78.157.42.101 78.157.42.100 10.202.10.202 10.202.10.102 185.55.226.26 185.55.225.25 10.202.10.10 10.202.10.11 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1 1.0.0.1"
#timeout="10s"


# Functions
function change_dns () {

	echo 'nameserver'  $1> /etc/resolv.conf
	echo '############################'
	cat /etc/resolv.conf
	echo '$$$$$$$$$$$$$$$$$$$$$$$$$$$$'

}

function download() {
    timeout $timeout wget -q -O /tmp/$1  --no-dns-cache $file_url 
}

function download_speed() {
du -s /tmp/$1 >> database
rm /tmp/$1
}





# Execute the functions
touch database
cp /etc/resolv.conf /etc/resolv.conf.bak
for i in $dns
do
change_dns $i
download $i
download_speed $i
done
echo '*********************'
echo best dns server is `sort -rn database| head -1| cut -d'/' -f3 | tee -a output`
echo '*********************'
rm database
cat /etc/resolv.conf.bak > /etc/resolv.conf
