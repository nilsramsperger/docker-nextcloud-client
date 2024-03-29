# Nextcloud client
This image provides a Nextcloud client to sync a Docker volume to a Nectcloud location.

## Deprecated
This repo was moved to [GitLab](https://gitlab.com/nilsramsperger/docker-nextcloud-client).

## Usage
To start the container run `docker run -d --init --name nextcloud-client --restart unless-stopped -v nextcloud-data:/home/nextcloud/data -e USER='myuser' -e PSWD='mypswd' -e HOST='https://myhost' nilsramsperger/nextcloud-client`
The env parameters `USER`, `PSWD` and `HOST` have to be replaced with username, password and host URL of the NextCloud server.

The files will be synced to the continer's `/home/nextcloud/data` directory.
If you want to sync a docker volume to a certian location within the synced directory structure, just exchange the `-v` parameter accordingly.
i.e.: `-v image-files:/home/nextcloud/data/image-files`

Synchronization is performed every 60 seconds.

## FAQ
### Question
Existing files on Nextcloud server are not synced to client.
The docker log tells, that access was denied.

### Answer
Folders might be created with wrong rights on first sync.
Tap into the continer by `docker exec -it nextloud ash`.
Then switch to the Nextcloud folder by `cs /home/nextcloud/data`.
`ls -Al` should show folders owned by `root:root`.
Issue a `chown -R nextcloud:nextcloud *` to fix it.
Then `exit` the container.