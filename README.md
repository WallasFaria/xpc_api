# README

Esta API foi projetada para atender ao Projeto da PÓS Graduação da XPE.

## Rodando a aplicação com Docker

```bash
docker-compose up
```

## Rodando a aplicação sem Docker

### Dependencias:
- `ruby 3.2`
- `rails 8.x`
- `sqlite3`

### Setup inicial:

```bash
bundle install
rails db:create db:migrate
```

### Iniciando servidor:

```
rails s
```

### Links:
[Documentação da API](https://documenter.getpostman.com/view/17666956/2sAYBUDCGq)

