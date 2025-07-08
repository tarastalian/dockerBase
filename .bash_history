services:
  db:
    image: mysql:8.0.33
    platform: linux/x86_64
    command: --default-authentication-plugin=mysql_native_password
    volumes:
      - "db_app:/var/lib/mysql"
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    ports:
      - 3306:3306
    networks:
      - symfony_app
  php:
    build:
      context: ./php
      args:
        TIMEZONE: ${TIMEZONE}
    ports:
      - 9003:9003
    volumes:
      - ../:/var/www/symfony:cached
      - ./historial_bash/historial_bash:/root/.bash_history # Historial bash persistente
      - symfony_app_var:/var/www/symfony/var
      - symfony_app_vendor:/var/www/symfony/vendor
      # - ./docker/php/conf.d/xdebug.ini:/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
      # - ./docker/php/conf.d/error_reporting.ini:/usr/local/etc/php/conf.d/error_reporting.ini
    networks:
      - symfony_app
    tty: true
    stdin_open: true
    working_dir: /var/www/symfony
  nginx:
    build:
      context: ./nginx
    volumes:
      - ../:/var/www/symfony:cached
      - symfony_app_var:/var/www/symfony/var
      - symfony_app_vendor:/var/www/symfony/vendor
    ports:
      - 80:80
      - 8000:8000
    networks:
      - symfony_app
    env_file:
      - .env.nginx.local
    environment:
      NGINX_BACKEND_DOMAIN: localhost
volumes:
  symfony_app_var:
  symfony_app_vendor:
  db_app:
networks:
  symfony_app:
composer create-project symfony/website-skeleton . --help
composer create-project symfony/website-skeleton:"6.4.*" .
ls -la
cd app/
ls -la
cd ..
cd app
ls
cd ..
rm app --r
ls
rm var
rm var -r
cd var/
ls -la
cd ..
ls -la
rm vendor/ -r
cd ..
composer create-project symfony/website-skeleton:"6.4.*" .
composer create-project symfony/website-skeleton:"6.4.*" . --remove-vcs --no-interaction
cd symfony/
composer create-project symfony/website-skeleton:"6.4.*" . --remove-vcs --no-interaction
composer create-project symfony/website-skeleton:"6.4.*" temp_symfony
composer create-project symfony/website-skeleton:^6.4 .
composer create-project symfony/website-skeleton:^6.4 temp_symfony
composer create-project symfony/website-skeleton temp_symfony
joe
apt-get install joe
cd temp_symfony/
joe composer.json 
composer update
composer require phpstan/phpdoc-parser:^0.5.10 --dev
composer require phpstan/phpdoc-parser:^0.5.10 --dev
composer update --with-all-dependencies
composer remove phpstan/phpdoc-parser
composer update -W
composer update -W
composer require symfony/flex --no-interaction
composer require symfony/flex --no-interaction
composer require symfony/flex --no-interaction
symfony-cmd
composer require symfony/flex --no-interaction
composer update -W
php bin/console cache:clear
cd ..
ls -la
cd temp_symfony/
ls -la
cd ..
mv temp_symfony/* temp_symfony/.* . 2>/dev/null || true
ls
ls -la
cd translations/
cd ..
cd temp_symfony/
ls -la
cd vendor/
ls
cd ..
cd ..
composer install
ls -la
cd var/
ls -la
cd ..
cd var/
ls -la
mkdir cache
chmod 777 cache
mkdir log
chmod 777 log
tail -f log/dev.log 
node --version
npm --version
cd /var/www/symfony && composer install
cd /var/www/symfony && php bin/console cache:clear
composer require symfony/uid
composer require nelmio/api-doc-bundle
cd /var/www/symfony && php bin/console debug:container knp_paginator
git remote add origin https://github.com/tarastalian/dockerBase.git
git init
git remote add origin https://github.com/tarastalian/dockerBase.git
git add .
git status
git commit -m "First Commit"
git push
git push --set-upstream origin master
git push --set-upstream origin master
git push --set-upstream origin master
git push --set-upstream origin master
joe .token
touch .token
vi .token 
apt-get install joe
joe .token
joe .gitignore 
git push --set-upstream origin master
git config --global credential.helper cache
git push --set-upstream origin master
ssh-keygen -t ed25519 -C "tarastalian@gmail.com"
cat ~/.ssh/id_ed25519.pub
git push --set-upstream origin master
git push 
git push --set-upstream origin mastergit remote set-url origin git@github.com:tarastalian/dockerBase.git
git remote set-url origin git@github.com:tarastalian/dockerBase.git
git push
git push --set-upstream origin master
joe .gitignore
