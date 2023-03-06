### how to build this project inside docker ###
```docker run -it -v `pwd`:/app -w /app -p 8082:8080 golang bash```
  ```go run hello.go```
### how to build hello.go ###
  ```go build  -o bin/hello  hello.go ```
### how to build this project with docker file ###

```docker build -t idamal/buildhellogo . ```

```docker run -p 8085:8080 idamal/buildhellogo```



 



