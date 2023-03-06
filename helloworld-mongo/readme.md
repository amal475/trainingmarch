docker run -it --network training-march-1 --ip 10.0.0.100 -v `pwd`/data:/data/db -v `pwd`/init.js:/docker-entrypoint-initdb.d/init.js mongo

### network dns

docker network create --subnet=172.20.0.0/16 sqoin.training.net  
docker run -d --name dns --network sqoin.training.net --ip 172.20.0.2 --restart always sameersbn/squid:3.5.27-2
docker run -it --name mongo --network sqoin.training.net --ip 172.20.0.3 -v `pwd`/data:/data/db -v `pwd`/init.js:/docker-entrypoint-initdb.d/init.js mongo
docker exec mongo bash -c 'echo "nameserver 172.20.0.2" >> /etc/resolv.conf'
