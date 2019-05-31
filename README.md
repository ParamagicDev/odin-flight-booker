# Odin Flight Booker

## Purpose

A rails app for booking flights.
This is merely a sample app to show how nested attributes would work

[The Odin Project flight
booker link](https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms?ref=lnav#assignment)

[Deployed application](https://paramagic-flight-booker.herokuapp.com/)

## Ruby version

- Ruby 2.6.2

## System dependencies

- Ruby 2.6.2
- Rails 5.2.3
- Yarn 1.0+
- Webpack
- TailwindCSS
- Sqlite3 as a local DB
- PostgreSQL as production DB

## Getting Started

### Initial setup

```bash
git clone https://github.com/ParamagicDev/odin-flight-booker.git
cd odin-flight-booker
bundle install --without-production
yarn install
```

#### Local development

```bash
rails db:migrate
rails db:seed
```

In seperate terminals run the following:

```bash
./bin/webpack-dev-server
rails server
```

Now you can view your app in localhost:3000

#### Deployment to heroku

```bash
heroku create
heroku buildpacks:clear
heroku buildpacks:add heroku/nodejs --index 1
heroku buildpacks:add heroku/ruby --index 2
git push heroku master
heroku run rails db:migrate
heroku run rails db:seed
heroku open
```

The above will automatically run

```bash
bundle exec rails webpacker:compile
```

In production so you won't have to specify the command.

## Database creation

```bash
rails db:migrate
rails db:seed
```

## How to run the test suite
```bash
bundle install
rails db:migrate
rails test
```

## Fun little extra items

Tailwind CSS / Webpacker are integrated in this project

## Docker integration

I have included docker support in this repo.

```bash
# builds the image
docker-compose build 

# runs the test suite
docker-compose -f docker-compose.test.yml run --rm web

# exposes the container on localhost:3000
docker-compose up
```

Optionally, I have created rake tasks for easily running these commands
```bash
rails docker:build # builds the image
rails docker:test # tests the container
rails docker:start # allows you the access the server at localhost:3000
```
