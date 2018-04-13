FROM php:7.0-apache

RUN apt-get update && apt-get install -y apache2

RUN a2enmod rewrite
