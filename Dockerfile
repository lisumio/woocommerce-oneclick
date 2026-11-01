
FROM wordpress:php8.3-apache

# WP-CLI
COPY --from=wordpress:cli /usr/local/bin/wp /usr/local/bin/wp

# Redis PHP extension
RUN pecl install redis && docker-php-ext-enable redis

# PHP configuration
COPY config/php.ini /usr/local/etc/php/conf.d/zz-custom.ini
