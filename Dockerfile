FROM php:7-fpm

RUN apt update && apt install -y \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    openssh-client

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# I have been created a copy of my .ssh because my Dockerfile isn't in the same path.
COPY ./ssh_copy /root/.ssh

COPY --from=composer:1.10.22 /usr/bin/composer /usr/local/bin/composer

RUN composer config --global --auth github-oauth.github.com your_github_token

WORKDIR /var/www/work