#!/bin/bash

docker rm $(docker ps -a -q  --filter ancestor="myarchvm") \
&& docker build -t myarchvm .\
&& docker run -it --name myarchcontainer myarchvm