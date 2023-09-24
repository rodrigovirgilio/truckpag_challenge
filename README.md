# Truckpag - challenge

## Installation

First up, your system will need the
[prerequisites for running Ruby on Rails installed](https://guides.rubyonrails.org/getting_started.html)

## Previous Requirements (Linux / Mac OS X)
* [Ruby 3.1.2](https://www.ruby-lang.org)
* [Rails 7.0.8](http://railsinstaller.org)
* [MongoDB](https://www.mongodb.com)
* [Elasticsearch](https://www.elastic.co)
* [Bundler gem](https://github.com/bundler/bundler)

Once you have these:

    # Checkout the project
    $ git clone git@github.com:rodrigovirgilio/truckpag_challenge.git
    $ cd truckpag_challenge

    # Install the project dependencies
    $ gem install bundler
    $ bundle **install**

    # Start the local web server
    $ bundle exec rails s

Or using docker:

    # Checkout the project
    $ git clone git@github.com:rodrigovirgilio/truckpag_challenge.git
    $ cd truckpag_challenge

    # Prepare container
    # On Mac use: `docker-compose`

    $ docker compose build
    $ docker compose up -d

You should then be able to navigate to http://localhost:3000 in a web browser.

## Test suite
  $ bundle exec rspec
## Automatic import by CRON every day at 4 a.m.:
  [schedule.rb](https://github.com/rodrigovirgilio/truckpag_challenge/blob/main/config/initializers/schedule.rb)

## Or manual by rake console:
  $ bundle exec rake import_files:call

**[image]**
## Rake to generate token for API authentication:
  $ bundle exec rake generate_token:authenticate

## Steps to perform the tasks

## Generate token for API authentication in terminal:

### 1) By rake task
```ruby
$ bundle exec rake generate_token:authenticate
Authentication successfully created
e7eea2ed3b6055c4e9fe3cc4ec5dac51
```

**[image]**

### 2) Or by terminal
```ruby
$ bundle exec rails c
$ auth = Authentication.create(name: "Authentication", token: SecureRandom.hex)
auth.token
"e7eea2ed3b6055c4e9fe3cc4ec5dac51"
```

## Product management by API:

### API Details
### GET /

```bash
curl --request GET \
  --url 'http://localhost:3000'
```

#### 200 - OK
**[image]**

### Index
### GET /api/v1/products?page=1&per_page=2

```bash
curl --request GET \
  --url 'http://localhost:3000/api/v1/products?page=1&per_page=2' \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 200 - OK
**[image]**

#### 401 - Unauthorized
**[image]**

### Show
### GET /api/v1/products/:code

```bash
curl --request GET \
  --url http://localhost:3000/api/v1/products/73490180293 \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 200 - OK
**[image]**

#### 401 - Unauthorized
**[image]**

#### 422 - Unprocessable Entity
**[image]**

### Update
### PUT /api/v1/products/:code

```bash
curl --request PUT \
  --url 'http://localhost:3000/api/v1/products/73490180293?status=published&creator=test' \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 200 - OK
**[image]**

#### 401 - Unauthorized
**[image]**

#### 422 - Unprocessable Entity
**[image]**

### Delete
### DELETE /api/v1/products/:code

```bash
curl --request DELETE \
  --url http://localhost:3000/api/v1/products/73490180293 \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 200 - OK
**[image]**

#### 401 - Unauthorized
**[image]**

#### 422 - Unprocessable Entity
**[image]**

## Documentation API - http://localhost:3000/api-doc

**[image]**
