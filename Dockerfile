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

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

COPY composer.lock composer.json ./

RUN composer install --prefer-dist --no-scripts --no-autoloader

COPY . .
# Create system user to run Composer and Artisan Commands
RUN groupadd -g 1000 fsl
RUN useradd -u 1000 -ms /bin/bash -g fsl fsl
COPY --chown=fsl:fsl docker-compose /var/www
USER fsl







