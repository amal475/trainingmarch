### How to run this project

`docker build -t idamal/php-mongo .`

`` docker run --network training-march-1 --ip 10.0.0.5 -p 9093:80 -it -v `pwd`:/code -w /code  idamal/php-mongo bash  ``

`php -S 0.0.0.0:80`

#### network dns

docker run --name php --network sqoin.training.net --ip 172.20.0.4 -p 9093:80 -it -v `pwd`:/code -w /code idamal/php-mongo bash
docker exec mongo bash -c 'echo "nameserver 172.20.0.2" >> /etc/resolv.conf'
update file index php
// Connect to MongoDB server
$manager = new MongoDB\Driver\Manager("mongodb://mongo:27017");
`php -S 0.0.0.0:80`
