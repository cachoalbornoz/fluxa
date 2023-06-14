FROM php:7.4-apache
RUN apt-get update -y
RUN apt-get install -y git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get install -y zlib1g-dev libpng-dev
RUN docker-php-ext-install mysqli pdo_mysql gd
RUN mkdir -p /var/www/fluxa
RUN a2enmod rewrite
WORKDIR /var/www/fluxa
RUN rm -r /var/www/html
COPY ./comandos.txt /home/comandos.sh
RUN chmod +x /home/comandos.sh
CMD ["/home/comandos.sh"]
EXPOSE 80
CMD apachectl -D FOREGROUND

# Instalar las dependencias de Composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#ENV COMPOSER_ALLOW_SUPERUSER=1
# Ejecutar los comandos de Composer para instalar las dependencias
#RUN composer install --no-interaction --no-scripts --no-plugins
# Establecer los permisos adecuados en los directorios de almacenamiento de Laravel
#RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache