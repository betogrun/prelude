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
$ docker-compose run --rm --no-deps web bundle exec rails new . --force -d postgresql -j esbuild --css tailwind 
$ docker-compose run --rm web bundle add foreman --group "development, test"
```

Change the files ownership if you are using linux.
```
$ sudo chown -R $USER:$USER .
```

## Enable esbuild and Tailwind

Add the following content to `package.json`

```
"scripts": {
    "build": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds",
    "build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"
  }
```

## Update the database configuration

Add the following content to `config.database` default entry.

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: <%= ENV.fetch("DATABASE_HOST") %>
  username: <%= ENV.fetch("DATABASE_USER") %>
  password: <%= ENV.fetch("DATABASE_PASSWORD") %>
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


