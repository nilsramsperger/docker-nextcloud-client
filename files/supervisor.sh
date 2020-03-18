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
    chmod -R 755 /home/nextcloud/data
    /bin/su -s /bin/ash nextcloud -c "nextcloudcmd --non-interactive -u '$USER' -p '$PSWD' /home/nextcloud/data '$HOST'"
    echo "Sync done"
    sleep 60
done