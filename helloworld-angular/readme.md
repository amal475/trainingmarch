## How to run dev environment

`` docker run -it -v `pwd`:/code -w /code ange10k/angularcli  bash  ``

` ng serve  --host=0.0.0.0`

<img width="1149" alt="image" src="https://user-images.githubusercontent.com/55437881/222406040-de65277d-ee15-4be5-9400-15f541b9508f.png">

## How to build environment

`` docker run -it -v `pwd`:/code -w /code ange10k/angularcli  bash  ``

`ng build --prod`
<img width="1216" alt="image" src="https://user-images.githubusercontent.com/55437881/222471735-d14952fa-69fe-4096-a8c8-9d1275078b80.png">

## How to run build

`docker run -p 8083:80 idamal/angularnginx `

## How to run deployment

`docker build -t `
