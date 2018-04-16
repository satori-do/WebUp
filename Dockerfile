FROM php:7.0-apache

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

COPY composer.json ./
COPY composer.lock ./

RUN composer install --no-scripts --no-autoloader
COPY . ./
RUN composer dump-autoload --optimize && \
        composer run-scripts post-install-cmd
