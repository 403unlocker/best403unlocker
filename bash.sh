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
