FROM php:7.4-apache

RUN a2enmod rewrite

RUN apt-get update -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get install -y git zlib1g-dev libpng-dev libzip-dev unzip
RUN docker-php-ext-install zip mysqli pdo_mysql gd

COPY ./comandos.txt /home/comandos.sh
RUN chmod +x /home/comandos.sh

RUN rm -r /var/www/html
RUN mkdir -p /var/www/sgis
WORKDIR /var/www/sgis

CMD ["bash", "-c", "/home/comandos.sh && apachectl -D FOREGROUND"]


#Cambiar el puerto de Apache
# RUN sed -i "s/Listen 80/Listen 8080/" /etc/apache2/ports.conf 

# Instalar las dependencias de Composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#ENV COMPOSER_ALLOW_SUPERUSER=1
# Ejecutar los comandos de Composer para instalar las dependencias
#RUN composer install --no-interaction --no-scripts --no-plugins
# Establecer los permisos adecuados en los directorios de almacenamiento de Laravel
#RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache