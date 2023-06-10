<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Repository
This is a repository where API were created with laravel sanctum to make a simple To-Do List whose has many tasks.
It followed Laravel version 8 and php version 7.4.
# To Run
Install all the dependencies using composer

    composer install


Copy the example env file and make the required configuration changes in the .env file

    cp .env.example .env

Run the database migrations (Set the database connection in .env before migrating)

    php artisan migrate

Start the local development server

    php artisan serve



# Database seeding
    php artisan db:seed

### Credentials to login:

    email: user@api.com
    password: user

To get API end-points

    localhost:8000/api/to-do-lists
    localhost:8000/api/tasks

To register or login  or logout

    localhost:8000/api/register
    localhost:8000/api/login
    localhost:8000/api/logout


## Running the Application with Docker Compose

Build the app image with the following command:

    docker-compose build app

To run the environment in background mode with:
    
    docker-compose up -d

Run following commands in terminal to migrate tables and seed in container database

    docker-compose exec app php artisan migrate --seed

To access  server’s domain name or IP address on port 8000:
    
    http://localhost:8000


## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
