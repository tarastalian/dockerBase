Sigue estos pasos para desplegar el proyecto Symfony en un entorno tradicional (sin Docker).  
**Nota:** Las contraseñas y datos sensibles se gestionan mediante secretos del sistema o variables de entorno, no en archivos de código.

### 1. Clona el repositorio

```sh
git clone <URL_DEL_REPOSITORIO>
cd <NOMBRE_DEL_PROYECTO>
```

### 2. Instala las dependencias del sistema

Asegúrate de tener instalados PHP (>=8.1), Composer, un servidor web (Nginx o Apache) y MySQL/MariaDB.  
Ejemplo en Debian/Ubuntu:

```sh
sudo apt update
sudo apt install php php-cli php-fpm php-xml php-mbstring php-intl php-mysql php-curl php-zip composer mysql-server
```

### 3. Configura las variables de entorno

Copia el archivo `.env` a `.env.local`:

```sh
cp .env .env.local
```

Edita `.env.local` y configura la variable `DATABASE_URL` usando los valores de usuario, contraseña y base de datos que tengas definidos como secretos o variables de entorno.  
Por ejemplo:

```
DATABASE_URL="mysql://<USUARIO>:<CONTRASEÑA>@127.0.0.1:3306/<NOMBRE_BD>?serverVersion=8.0.33"
```

**Importante:**  
No escribas contraseñas en el archivo, usa referencias a variables de entorno o gestores de secretos del sistema.  
Ejemplo en `.env.local`:

```
DATABASE_URL="mysql://${DB_USER}:${DB_PASS}@127.0.0.1:3306/${DB_NAME}?serverVersion=8.0.33"
```

Y exporta los secretos antes de ejecutar Symfony:

```sh
export DB_USER=app_user
export DB_PASS=helloworld
export DB_NAME=app_db
```

### 4. Instala las dependencias de Composer

```sh
composer install
```

### 5. Ejecuta las migraciones de base de datos

```sh
php bin/console doctrine:migrations:migrate
```

### 6. Limpia la caché

```sh
php bin/console cache:clear
```

### 7. Configura el servidor web

Configura tu servidor web (Nginx o Apache) para que el document root apunte a la carpeta `/public` del proyecto Symfony.

### 8. Accede a la aplicación

Abre tu navegador y accede a la URL configurada en tu servidor web (por ejemplo, http://localhost).

---

**¡Listo! El proyecto Symfony estará desplegado y funcionando sin Docker.**
