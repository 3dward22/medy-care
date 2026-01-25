FROM php:8.2-cli

# Install system deps
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    curl

# PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring zip bcmath gd

# Set working dir
WORKDIR /app

# Copy files
COPY . .

# Install composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

EXPOSE 8080
ENV WEB_CONCURRENCY=1
CMD php -S 0.0.0.0:$PORT -t public
