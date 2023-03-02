## how to build  this project inside docker 
 ```docker build -t idamal/python-flask .```
 ## how to run this project inside docker 
   ```ddocker run -it -v $(pwd):/app -w /app -p 5002:5000 idamal/python-flask  bash```
   ```python hello.py```
