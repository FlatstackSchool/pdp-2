# PDP 2

## Project description

Практическое задание по Rails

## Основные задачи

* научиться работать с несколькими ролями
* научиться создавать простые JS виджеты
* научиться делать сортировку и поиск
* научиться работать с агрегацией данных с счетчиками
* научиться работать с сессией и доменами
* научиться подключать админку

### Необходимо реализовать SaaS со следующими User Stories

* Можно зарегать компанию. Тот, кто зарегал компанию тот Owner.
* У компании свой поддомен.
* В компанию можно логиниться.
* В компанию можно регаться.
* У компании есть один блог с постами.
* Все пользователи компании могут создавать посты.
* Все пользователи компании могут писать комменты к постам.
* Пользователи могут редактировать свои посты и комменты.
* Owner может редактировать все посты и коменты.
* Пользователи и могут ставить рейтинг звездочками (от 1 до 5) постам.
* Можно просмотреть всех пользователей в порядке среднего рейтинга их постов. Должно показываться Firstname, Lastname, количество постов, средний рейтинг.
* На странице просмотра всех пользователей можно искать пользователей по Firstname, Lastname, Email.
* На странице просмотра всех пользователей можно фильтровать пользователей по минимальному среднему рейтингу.
* На странице просмотра всех пользователей можно сортировать пользователей по рейтингу, количеству постов. Двух пользователей с одинаковым количеством постов нужно сортировать по рейтингу.
* Должна быть админка для управления компаниями, пользователями, постами, комментами.

### Особенности реализации

* использовать Rails Base;
* покрытие RSpec Feature тестами;
* приятный дизайн;
* проект деплоится на Heroku;
* законченные user stories ИПР

### Для проверки

* не использовать accept_nested_attributes
* использовать Form Object при регистрации
* не вызывать интерактор в Form Object при регистрации
* валидации должны быть в Form Object, а не в моделях
* валидации уникальности имени и поддомена
* транзакция в интеракторе при регистрации юзера и компании

## Dependencies

* PostgreSQL 9.3
* Ruby 2.2.3
* PhantomJS
* Rails 4

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

## Quick Start

```bash
# clone repo
git clone git@github.com:FlatstackSchool/pdp-2.git
cd repo

# run setup script
bin/setup

# configure ENV variables in .env
vim .env

# run server on 5000 port
bin/server
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs
