
#!/bin/sh
set -eu

if [ ! -f .env ]; then
    cp .env.example .env
fi

if [ -z "${APP_KEY:-}" ]; then
    APP_KEY="base64:$(php -r 'echo base64_encode(random_bytes(32));')"
    export APP_KEY
fi

export DB_CONNECTION=sqlite
export DB_DATABASE=/var/www/html/database/database.sqlite

PORT="${PORT:-10000}"
sed -i "s/^Listen .*/Listen ${PORT}/" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:[0-9]*>/<VirtualHost *:${PORT}>/" /etc/apache2/sites-available/000-default.conf

mkdir -p bootstrap/cache \
    storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    database

touch database/database.sqlite

chown -R www-data:www-data storage bootstrap/cache database

php artisan migrate --force
php artisan db:seed --force

php artisan config:cache
php artisan route:cache
php artisan view:cache

exec apache2-foreground
