FROM php:7.0-apache

RUN a2enmod rewrite

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update \
    && apt-get install -y \
    git

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer
    
COPY . ./
#COPY composer.json ./
#COPY composer.lock ./

RUN composer install --no-scripts --no-autoloader

#RUN composer dump-autoload --optimize && \
#        composer run-scripts post-install-cmd
