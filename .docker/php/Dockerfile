FROM php:8.2-fpm-buster

ARG TIMEZONE=Europe/Madrid

COPY php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

# Instala dependencias, locales, alias, etc.
RUN apt-get update && apt-get install -y \
    gnupg g++ procps openssl git unzip zlib1g-dev libzip-dev \
    libfreetype6-dev libpng-dev libjpeg-dev libicu-dev \
    libonig-dev libxslt1-dev acl locales \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc \
    && sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=es_ES.UTF-8

ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES:es
ENV LC_ALL es_ES.UTF-8

# Configurar Git globalmente para evitar errores
RUN git config --global user.name "Jose M Izquierdo" \
    && git config --global user.email "Jose.Izquierdo@bluumi.com"

# Configura bash para guardar el historial de comandos
RUN echo "export HISTFILE=/var/www/symfony/.bash_history" >> /root/.bashrc && \
    echo "export HISTSIZE=1000" >> /root/.bashrc && \
    echo "export HISTFILESIZE=2000" >> /root/.bashrc && \
    echo "PROMPT_COMMAND='history -a'" >> /root/.bashrc
	
RUN docker-php-ext-configure gd --with-jpeg --with-freetype

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
    && echo "[PHP]\ndate.timezone = \"${TIMEZONE}\"" > /usr/local/etc/php/conf.d/tzone.ini \
    && date
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar Symfony CLI de forma global y funcional
RUN curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony*/bin/symfony /usr/local/bin/symfony \
    && chmod +x /usr/local/bin/symfony
	# \
    # && symfony --version

# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN pecl install xdebug && docker-php-ext-enable xdebug

# Node.js y npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update && apt-get install -y nodejs

RUN node -v && npm -v

COPY conf.d/xdebug.ini $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini
COPY conf.d/error_reporting.ini $PHP_INI_DIR/conf.d/error_reporting.ini

WORKDIR /var/www/symfony
