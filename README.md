Rails API
================================

[![CircleCI](https://circleci.com/gh/maksimpanarin/project_x.svg?style=svg)](https://circleci.com/gh/maksimpanarin/project_x)

REQUIREMENTS
------------

The minimum requirements for this project:

- Ruby 2.7.2
- Rails 6.1.0
- Postgres 11.3

Installing using Docker
-----------------------

> You need to have [docker](http://www.docker.com) (1.10.0+) and
[docker-compose](https://docs.docker.com/compose/install/) (1.6.0+) installed.

You can install the application using the following commands:

```bash
git clone git@github.com:maksimpanarin/project_x.git
cp .env{.example,} && cp docker-compose.override.yml{.dist,}
docker-compose up -d --build
```

It may take some minutes to download the required docker images. When
done, you need to execute the following commands:

```sh
docker-compose exec web bash
bin/rails db:migrate
chown -R www-data:www-data .
```

After this steps, you can access your app from [http://localhost:3000](http://localhost:3000).