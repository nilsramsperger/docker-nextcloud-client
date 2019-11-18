#!/bin/ash

term_handler() {
    echo "SIGTERM received"
    exit 143;
}

echo "Starting Nextcloud client"

trap term_handler SIGTERM

while true
do
    echo "Start sync"
	/bin/su -s /bin/ash nextcloud -c "nextcloudcmd --non-interactive -u '$USER' -p '$PSWD' /home/nextcloud/data '$HOST'"
    echo "Sync done"
	sleep 60000
done