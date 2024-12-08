FROM php:8.1-fpm-alpine

# Cài đặt các extension cần thiết cho Laravel
RUN apk --no-cache add libpng libjpeg libfreetype && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql mysqli opcache

# Cài đặt Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy mã nguồn vào container
COPY ./src /var/www/html
