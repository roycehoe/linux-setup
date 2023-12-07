#!/bin/bash

docker rm $(docker ps -a -q  --filter ancestor="mydebianvm") \
&& docker build -t mydebianvm .\
&& docker run -it --name mydebiancontainer mydebianvm