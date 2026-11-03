# Counter POS - TFA6

This is a Laravel project for IT0049 TFA6: From Arrays to Eloquent.

The application has four pages: Home, About, Customer Accounts, and User Accounts.

## Project Links

GitHub Repository: https://github.com/mrcs098/TA6

Live Website: https://ta6-counter-pos.onrender.com

## Requirements

PHP 8.4.1 or newer and Composer 2.

## How to Run Locally

1. Download the project.
2. Open a terminal inside the project folder.
3. Run the following commands one at a time:

```bash
composer install
```

Copy `.env.example` to `.env`, then run:

```bash
php artisan key:generate
php artisan migrate --seed
php artisan serve
```

Open http://127.0.0.1:8000 in your browser.

## Database

The application uses SQLite and Laravel Eloquent.

The Customer and User models retrieve records from the database instead of static PHP arrays.

Migrations create the database tables, and the seeder inserts five fictional customers and five fictional users.

## Hosting

The application is hosted on Render using Docker.

The database is initialized and seeded when the application starts. The free hosting environment does not provide permanent SQLite storage.
