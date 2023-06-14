FROM php:7.4-fpm-alpine
RUN docker-php-ext-install pdo pdo_mysql

# Copiar los archivos de la aplicación al contenedor
COPY ./src /var/www/html

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Instalar las dependencias de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1

# Ejecutar los comandos de Composer para instalar las dependencias
RUN composer install --no-interaction --no-scripts --no-plugins

# Establecer los permisos adecuados en los directorios de almacenamiento de Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache