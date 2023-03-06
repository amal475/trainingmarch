### How to run this project ###
```docker build -t idamal/php-mongo .```

```docker run --network training-march-1 --ip 10.0.0.5 -p 9093:80 -it -v `pwd`:/code -w /code  idamal/php-mongo bash ```

```` php -S 0.0.0.0:80 ````