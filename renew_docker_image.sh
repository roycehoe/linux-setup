#!/bin/bash

docker rm $(docker ps -a -q  --filter ancestor="mydebianvm") \
&& docker build -f Dockerfile.debian -t mydebianvm .\
&& docker run -it --name mydebiancontainer mydebianvm