# Nextcloud client
This image provides a Nextcloud client to sync a Docker volume to a Nectcloud location.

## This image is not production ready!

## Usage
To start the container run `docker run -d --init --name nextcloud-client --restart unless-stopped -v nextcloud-data:/home/nextcloud/data -e USER='myuser' -e PSWD='mypswd' -e HOST='https://myhost' nilsramsperger/nextcloud-client`