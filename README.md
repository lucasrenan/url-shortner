# Url Shortener

This Rails app is an implementation of a bit.ly like url shortener. It aims to be simple and fast.

Shortened urls are generated using a base62 token strategy, trying to avoid collisions and also reducing the database size. Tokens have 7 characters, which gives us 62^7 possible tokens.

## Technologies

* Ruby 2.5.0
* Rails 5.1.4
* Postgres 10.1

## Development with Docker

Building web image:
```sh
  docker-compose build
```

Setting the database up:
```sh
  docker-compose run --rm web rake db:create
  docker-compose run --rm web bin/setup
```

Running the app:
```sh
  docker-compose up
```

Running the specs:
```sh
  docker-compose run --rm web rspec
```

## TODO

- [ ] Cache (probably using Redis)
- [ ] Url sanitization and validation
