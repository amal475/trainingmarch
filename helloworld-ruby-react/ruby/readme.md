### How to run this project :###
#### run python####
```docker run -it -v `pwd`:/code -w /code  --network training-march-1 --ip 10.0.0.6 --name server-python idamal/python-flask bash```

```python hello.py```

### run ruby ###
```docker run -it -v `pwd`:/code -w /code -p 8081:8080 --network training-march-1 --name ruby-server --ip 10.0.0.5 idamal/ruby-sinatra  bash```

```ruby server.rb``