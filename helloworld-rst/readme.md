
### how to build this project inside docker ###
``` docker build -t idamal/rustnighyly .```

``` docker run -it -v `pwd`:/app -w /app -p 8081:8000 idamal/rustnighyly   bash ```

 ```cargo run ```
 ### how to build this project with  docker file  ###
 
  ``` docker run -it -v `pwd`:/app -w /appidamal/rustnighyly   bash ```
  
  ```cargo build --release ```
  
  ```docker build -t idamal/buildrust . ```
  
  ``` docker run -p 5000:8000 idamal/buildrust ```
  <img width="1215" alt="image" src="https://user-images.githubusercontent.com/55437881/222532550-107a7d8c-ff3c-430c-b363-0fb1ae8c24e1.png">



   



