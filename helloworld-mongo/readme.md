### how to run mongo inside docker

`docker run -it --network training-march-1 --ip 10.0.0.100 -v `pwd`/data:/data/db -v `pwd`/init.js:/docker-entrypoint-initdb.d/init.js mongo`

### how to run mongo inside docker with network dns

`docker network create --subnet=172.20.0.0/16 sqoin.training.net`

`docker run -d --name dns --network sqoin.training.net --ip 172.20.0.2 --restart always sameersbn/squid:3.5.27-2`

`` docker run -it --name mongo --network sqoin.training.net --ip 172.20.0.3 -v `pwd`/data:/data/db -v `pwd`/init.js:/docker-entrypoint-initdb.d/init.js mongo ``

`docker exec mongo bash -c 'echo "nameserver 172.20.0.2" >> /etc/resolv.conf'`

### how to run mongo inside server training.sqoin.net

`docker build -t idamal/mongohello -f dockerfilemongo .`

`docker push idamal/mongohello `

`` ssh ubuntu@training.sqoin.net`

`` docker run --network training-march --ip=172.18.0.34 -v `pwd`/data:/data/db -d idamal/mongohello``

`vi ngnix.conf`

` docker ps`

`take container id`

` docker stop container id`

`docker run -d -p 80:80 -v /home/ubuntu/nginx.conf:/etc/nginx/nginx.conf --network training-march --ip 172.18.0.2 nginx`
