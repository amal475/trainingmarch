## how to build  this project inside docker 
 ```docker build -t idamal/python-flask .```
 ## how to run this project inside docker in docker container 
   ```ddocker run -it -v $(pwd):/app -w /app -p 5002:5000 idamal/python-flask  bash```
   ```python hello.py```
   ## try now this url ###
      http://127.0.0.1:5000

