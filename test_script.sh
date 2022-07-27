#!/bin/sh
sudo -i
docker&8
sudo docker exec -it FYP /bin/bash
docker&8
sudo /opt/lmpp/lmpp start
