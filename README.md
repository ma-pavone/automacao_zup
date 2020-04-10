# Teste Zup - Automação loja Netshoes

Repositório para o teste da Zup Innovation

Utilizando Cucumber, Rspec, Capybara e Ruby

## Ruby

* Importante ter o Ruby 2.5+

### Instalar o bundle

```sh
gem install bundler
```

### Instalar as dependencias no projeto atraves do gemfile

```sh
bundle install
```

### Executar o projeto no chrome com UI

```sh
bundle exec cucumber -p chrome
ou
cucumber -p chrome
```

### Executar o projeto com chrome em headless

```sh
bundle exec cucumber -p chrome_headless
ou
cucumber -p chrome_headless
```
