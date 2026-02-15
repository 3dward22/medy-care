FROM php:8.2-cli

# System deps 
RUN apt-get update && apt-get install -y \
    git unzip libzip-dev libpng-dev libonig-dev libxml2-dev curl \
    default-mysql-client libmariadb-dev \
    && docker-php-ext-install pdo_mysql zip


# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install Node.js (for Vite build)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

WORKDIR /app

# Copy app
COPY . .

# Install PHP deps
RUN composer install --no-dev --optimize-autoloader

RUN php artisan optimize:clear \
 && php artisan config:clear \
 && php artisan route:clear \
 && php artisan view:clear



# Install JS deps + build assets (IMPORTANT)
RUN npm ci || npm install
RUN npm run build

# Permissions
RUN chown -R www-data:www-data storage bootstrap/cache

# Create Laravel temp dirs for Railway
RUN mkdir -p /tmp/framework/sessions /tmp/framework/cache /tmp/framework/views \
    && chmod -R 775 /tmp/framework

EXPOSE 8080
CMD ["sh", "-c", "php -S 0.0.0.0:$PORT -t public"]
