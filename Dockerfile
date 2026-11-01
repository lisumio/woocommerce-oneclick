
FROM wordpress:php8.3-apache

# Apache MPM compatibility
RUN a2dismod mpm_event mpm_worker 2>/dev/null || true

# WP-CLI
COPY --from=wordpress:cli /usr/local/bin/wp /usr/local/bin/wp

# Redis PHP extension
RUN pecl install redis && docker-php-ext-enable redis

# PHP configuration
COPY config/php.ini /usr/local/etc/php/conf.d/zz-custom.ini
