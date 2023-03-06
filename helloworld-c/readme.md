## how to build this project inside docker

`docker run -it -v $(pwd):/code -w /code gcc bash`

## now run the command

`gcc -o bin/helloworld helloworld.c `

## now run the command

`bin/helloworld`

## How to run deployment

`docker build -t idamal/hellocprod -f dockerfileprod .`
`docker push  idamal/hellocprod`
`ssh ubuntu@training.sqoin.net`
`docker run  --network training-march --ip 172.18.0.41 idamal/hellocprod`
