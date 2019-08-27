# Docker LAMP Stack

My personal Docker PHP Environment.

* PHP 7.2
* Apache 2.4
* PhpMyAdmin
* MariaDB 10.4

## TL;DR

1. Drop the project files under `./php/` (files served from `./php/public` )

2. Run `docker-compose up` .

## Setup

1. Drop the project files under `./php/`

2. The public folder with the facing _index.php_ and resources (images, css, etc) should be under `./php/public/`

3. If the framework being used sets other folder than `public` as the public folder for serving _index.php_ change Dockerfile and apache.conf under `./apache`

4. Database configs under *docker-compose.yml*

5. Once everything is set just run `docker-compose up`
