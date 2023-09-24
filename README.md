# Truckpag - challenge
# Backend Challenge 20230105

>  This is a challenge by [Coodesh](https://coodesh.com/) - https://lab.coodesh.com/virgilio/products-parser-20230105

### Video Presentation

[Video](https://www.loom.com/share/9dbdf3c8fbd148398a3573cecc42326c)

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
```ruby
  $ bundle exec rspec
```
## Automatic import by CRON every day at 4 a.m.:
  [schedule.rb](https://github.com/rodrigovirgilio/truckpag_challenge/blob/main/config/initializers/schedule.rb)

## Or manual by rake console:
```ruby
  $ bundle exec rake import_files:call
```

![Screenshot 2023-09-24 at 13 13 28](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/70043c06-4203-445a-9504-34f68124dd71)

![Screenshot 2023-09-24 at 13 14 07](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/59a65022-09e8-4585-95fd-4ccd3c1fbf50)

![Screenshot 2023-09-24 at 13 14 17](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/e0935d8f-5dde-47e9-a81b-db823fa12acc)


## Rake to generate token for API authentication:
```ruby
  $ bundle exec rake generate_token:authenticate
```
## Steps to perform the tasks

## Generate token for API authentication in terminal:

### 1) By rake task
```ruby
  $ bundle exec rake generate_token:authenticate
  Authentication successfully created
  e7eea2ed3b6055c4e9fe3cc4ec5dac51
```

![Screenshot 2023-09-24 at 13 15 53](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/1c76c234-5279-437b-a15d-5d14cb8d030a)


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
![Screenshot 2023-09-24 at 12 10 14](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/b88a4aa3-73f5-4696-93cc-33f021e35eb8)

![Screenshot 2023-09-24 at 12 29 28](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/24829b0d-953d-4c58-8007-c3be6ae2325b)


### Index - with pagination
### GET /api/v1/products?page=1&per_page=2

```bash
curl --request GET \
  --url 'http://localhost:3000/api/v1/products?page=1&per_page=2' \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 200 - OK
![Screenshot 2023-09-24 at 12 12 14](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/3cf3db41-0c3c-4106-b216-b7ef1897f311)


#### 401 - Unauthorized
![Screenshot 2023-09-24 at 12 12 31](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/800996ce-b91d-435d-9529-beae8b5725b3)


### Show
### GET /api/v1/products/:code

```bash
curl --request GET \
  --url http://localhost:3000/api/v1/products/73490180293 \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 200 - OK
![Screenshot 2023-09-24 at 12 14 19](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/6f27431b-d6f0-4e6c-b93c-01b6d283b871)


#### 401 - Unauthorized
![Screenshot 2023-09-24 at 12 14 30](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/a2e4dc48-83b0-4398-853f-9237aa8bc4ec)


#### 422 - Unprocessable Entity
![Screenshot 2023-09-24 at 12 14 50](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/94541f10-588a-4935-aade-2edd0444ebff)


### Update
### PUT /api/v1/products/:code

```bash
curl --request PUT \
  --url 'http://localhost:3000/api/v1/products/73490180293?status=published&creator=test' \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 200 - OK
![Screenshot 2023-09-24 at 12 18 26](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/d718ba82-59c5-4e68-b493-212ceefe811b)


#### 401 - Unauthorized
![Screenshot 2023-09-24 at 12 18 42](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/737bb319-c0d3-4a00-8aee-f152f089fb17)


#### 422 - Unprocessable Entity
![Screenshot 2023-09-24 at 12 18 58](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/43c20cf0-4386-46dc-8a45-0c7c913d86e3)


### Delete
### DELETE /api/v1/products/:code

```bash
curl --request DELETE \
  --url http://localhost:3000/api/v1/products/73490180293 \
  --header 'Authorization: 9eb23a38240d81c1fb1bb1a00f9251f1'
```
#### 204 - No Content
![Screenshot 2023-09-24 at 12 22 13](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/bea2f4d4-9439-4d8f-8e86-f638a7120af5)


#### 401 - Unauthorized
![Screenshot 2023-09-24 at 12 22 29](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/5aa4ada6-440a-4b2f-9033-db5f77b8c360)

#### 422 - Unprocessable Entity
![Screenshot 2023-09-24 at 12 24 42](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/4ffd8f57-4e4a-49dc-ac96-8c8af30a629b)


## Documentation API - http://localhost:3000/api-doc
![Screenshot 2023-09-24 at 12 30 13](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/2227b683-f699-449c-a335-35838cbec669)
![Screenshot 2023-09-24 at 12 30 05](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/b4e08978-ab60-4fe4-9dcc-e03a30e9e863)
![Screenshot 2023-09-24 at 12 29 54](https://github.com/rodrigovirgilio/truckpag_challenge/assets/392677/faaddbf0-083b-411e-919d-3528b636c622)

