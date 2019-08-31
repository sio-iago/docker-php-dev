FROM php:7.2-apache

RUN docker-php-ext-install bcmath mbstring mysqli pdo pdo_mysql

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf && \
    # Error Logging
    mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini" && \
    sed -i -e 's/^error_reporting\s*=.*/error_reporting = E_ALL/' $PHP_INI_DIR/php.ini && \
    sed -i -e 's/^display_errors\s*=.*/display_errors = On/' $PHP_INI_DIR/php.ini

ENV APACHE_DOCUMENT_ROOT /var/www/public

WORKDIR ${APACHE_DOCUMENT_ROOT}

COPY apache.conf /usr/local/apache2/conf/apache.conf

RUN echo "Include /usr/local/apache2/conf/apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf && \
    a2enmod rewrite