### how to build this project inside docker

`` docker run -it -v `pwd`:/app -w /app -p 8082:8080 golang bash ``
`go run hello.go`

### how to build hello.go

`go build  -o bin/hello  hello.go `

### how to build this project with docker file

`docker build -t idamal/buildhellogo . `

`docker run -p 8085:8080 idamal/buildhellogo`

### How to run deployment server in training sqoin.training.net

` docker build -t idamal/hellogoprod -f dockerfile-prod .`
`docker push  idamal/hellogoprod`
`docker run --network training-march --ip=172.18.0.32 -d idamal/hellogoprod `
`vi ngnix.conf`
`update file`

`docker ps `
` docker stop idcontainerngnix`
`docker start ngnix`
`docker run -d -p 80:80 -v /home/ubuntu/nginx.conf:/etc/nginx/nginx.conf --network training-march --ip 172.18.0.2 nginx`
