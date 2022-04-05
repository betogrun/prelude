# Prelude

Minimal boiler plate to create a dockerized Ruby on Rails 7 application.

## Clone the application
```
$ git clone https://github.com/betogrun/prelude.git your_application

# or

$ git clone git@github.com:betogrun/prelude.git your_application
```

## Generate the Rails project

Generate an application with Postgres database, esbuild and Tailwind CSS.
```
$ docker-compose run --no-deps web rails new . --force -d postgresql --edge -j esbuild --css tailwind
```

Change the files ownership if you are using linux.
```
$ sudo chown -R $USER:$USER .
```

## Update the database configuration

Go to `config/database.yml` and update the default entry.

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
```

## Create the database
```
$ docker-compose run --rm web rails db:create
```

## Running the application
```
$ docker-compose up
```


