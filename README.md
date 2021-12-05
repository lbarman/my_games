## A propos de l'application

Cette application est basée sur Laravel. Elle répond en PWA et peut donc être installé et jouée sur mobile en mode deconnecté.
Le but était de permettre d'avoir un système de gestion de cartes, afin de pouvoir fournir diférents types de jeux.
Plusieurs jeux ont étés ajoutés avec plus ou moins de cartes. Certains d'entre eux ne sont pas encore finalisées.

- Time's up
- Taboo
- Pictionary
- Brainstorm
- Petits meurtres et faits divers
- Loups garoux de Thiercelieux

Pour tester cette application, rendez vous sur 
https://games.gameandme.fr

Chaque membre peut ajouter des cartes, cela permet de lever les limites des jeux de cartes papiers.


## Installation

Creer un site avec le repertoire public comme root.
Définissez vos constantes dans le répertoire config/app.php et config/database.php
Creer une base de données mysql ("mygames" par défaut), 
puis faites les commandes: 

```html
composer update
php artisan migrate
```

## Connexion

- admin@admin.com / admin
- manager@manager.com / manager


## Fedora prerequisites

sudo dnf install php-cli php-json php-mbstring php-dom php-pdo php-gd php-mysqlnd

`.env`: change to `DB_CONNECTION` to `sqlite`, comment `#DB_DATABASE=homestead`, change `CACHE_DRIVER` to `array`

Remove `"caouecs/laravel-lang": "~3.0"` from `composer.json` (not needed anymore)

create keys `php artisan key:generate`

create database `touch database/database.sqlite`, `php artisan db:seed`

build `php artisan migrate`

## Deploy

docker-compose.yml
```yaml
version: '2'
services:
  partygames:
    build:
      context: ./data
    ports:
      - 127.0.0.1:8028:8000
    container_name: partygames
    volumes: 
      - ./data:/var/www/
```

Mixed content error:
https://stackoverflow.com/questions/34378122/load-blade-assets-with-https-in-laravel

Manifest error
https://github.com/koajs/basic-auth/issues/19