# Functions
check_and_source_env() {
if  [ -z "$dns" ]; then
    if [ ! -f ./.env ]; then
            wget -c https://raw.githubusercontent.com/ArmanTaheriGhaleTaki/best403unlocker/main/.env
    fi
 source .env
 fi
}

check_ip() {
    local input=$1
    local regex="^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

    if [[ $input =~ $regex ]]; then
            return 0
    else
            return 1
    fi
}

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
check_and_source_env
touch database
cp /etc/resolv.conf /etc/resolv.conf.bakup
for i in $dns
do
	if check_ip $i; then
change_dns $i
download $i
download_speed $i
	fi
done
echo '*********************'
echo best dns server is `sort -rn database| head -1| cut -d'/' -f3 | tee -a output`
echo '*********************'
rm database
cat /etc/resolv.conf.bakup > /etc/resolv.conf

