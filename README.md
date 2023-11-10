## Informações necessarias
Para executar este projeto é necessário instalar o [`docker`](#docker) e o [`docker compose `](#docker)

## Passo a passo, para instalar
Primeiro precisar buildar o projeto  e rodar o setup. Se não quiser rodar o setup que já vem o [`seed`](#criar-seed), pode-se criar com o [`create`](#criar-banco-de-dados) depois [`migrate`](#rodar-migration)
```
$ docker-compose build
$ docker-compose run web bundle exec rails db:setup
```

## Para rodar o projeto 
Antes de rodar o projeto precisa criar o banco de dados com o setup
```
$ docker-compose up
```

## Criar banco de dados
```
$ docker-compose run web bundle exec rails db:create
```

## Rodar Migration
```
$ docker-compose run web bundle exec rails db:migrate
```

## Criar seed
```
$ docker-compose run web bundle exec rails db:seed
```

## Rodar testes
```
$ docker-compose run web bundle exec rspec
```

## Rails console
```
$ docker-compose run web bundle exec rails c
```
## Rodar Sidekiq
Com o docker-compose up ja roda altomaticando mais se quiser rodar, pode-se rodar da forma abaixo
```
$ docker-compose run web bundle exec sidekiq -C config/sidekiq.yml
```
## Criar seed
```
$ docker-compose run web bundle exec rails db:seed
```
## Criar setup
```
$ docker-compose run web bundle exec rails db:setup
```
## Docker:
- Instale o docker-ce (Docker Community Edition) - https://docs.docker.com/install/linux/docker-ce/ubuntu/
- Instale o docker compose - https://docs.docker.com/compose/install/#install-compose
- Adicione permissão ao grupo de usuário:

```
$ sudo groupadd docker
$ sudo gpasswd -a $USER docker
```



