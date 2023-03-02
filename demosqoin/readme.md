### how to run this project###

```docker run -it -v `pwd`:/code -w /code  -p 8083:8080 gradle:jdk17 bash ``` 
```./gradlew build  ```
``java -jar ./build/libs/demosqoin-0.0.1-SNAPSHOT.jar``