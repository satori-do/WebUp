FROM php:7.0-apache

RUN a2enmod rewrite

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    MYSQL_HOSTNAME=localhost \
    MYSQL_USER=user \
    MYSQL_PASSWORD=123456 \
    MYSQL_DATABASE=rename \
    CONFIG_FILE=/var/www/html/config/config.php

RUN apt-get -y update && \
    apt-get install -y \
      curl \
      git \
      unzip \
      wget \
    && docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

COPY . ./

RUN composer install

COPY cont-conf.sh /cont-conf.sh
RUN chmod +x /cont-conf.sh
CMD /cont-conf.sh && apache2-foreground
