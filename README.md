# It Crow Test

### How to use (api)

First of all build the container, it can take some time then is a good momento to take some :coffee:
```
docker-compose build --no-cache
```

Create and migrate database
```
docker-compose run --rm api bundle exec rails db:create db:migrate
```

Last but not least run the server
```
docker-compose up
```

[if you wanna see how request works click here](https://github.com/oliveira-andre/it_crowd_test/tree/master/api)

### Tests

rubocop
```
docker-compose run --rm api bundle exec rubocop
```
