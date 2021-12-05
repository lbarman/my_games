FROM php:7.4-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u 1000 -d /home/partygames partygames
RUN mkdir -p /home/partygames/.composer && \
    chown -R partygames:partygames /home/partygames

# Set working directory
WORKDIR /var/www

COPY . /var/www
RUN chown -R partygames /var/www

RUN composer update
RUN php artisan key:generate 
RUN touch database/database.sqlite
RUN php artisan migrate
RUN php artisan config:cache
RUN php artisan route:cache
RUN chmod -R ugo+w storage
RUN chmod -R ugo+w bootstrap/cache

CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000