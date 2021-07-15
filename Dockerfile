FROM php:7.2-apache

# Install PDO MySQL driver
RUN docker-php-ext-install pdo mysqli pdo_mysql

RUN apt-get update -y && apt-get install -y libpng-dev libfreetype6-dev libyaml-dev

RUN pecl install yamL

RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-install gd

RUN usermod -u 1000 www-data

# Enable Apache mod_rewrite
RUN a2enmod rewrite
