FROM php:7.0-apache

RUN a2enmod rewrite

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

COPY composer.json ./rename.kr.ua
COPY composer.lock ./rename.kr.ua

RUN composer install --no-scripts --no-autoloader
COPY . ./
#RUN composer dump-autoload --optimize && \
#        composer run-scripts post-install-cmd
