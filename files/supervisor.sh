#!/bin/ash

term_handler() {
    echo "SIGTERM received"
    exit 143;
}

echo "Starting Nextcloud client"

trap term_handler SIGTERM

while true
do
	/bin/su -s /bin/ash nextcloud -c "nextcloudcmd --non-interactive -u '$USER' -p '$PSWD' /home/nextcloud/data '$HOST'"
	sleep 5000
done