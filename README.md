[![CI](https://github.com/Lyams/forUchiRuBlog/actions/workflows/ci.yml/badge.svg)](https://github.com/Lyams/forUchiRuBlog/actions/workflows/ci.yml)
[![Test Coverage](https://codecov.io/gh/lyams/forUchiRuBlog/graph/badge.svg)](https://codecov.io/gh/lyams/forUchiRuBlog)

### Задание
Напишите простой блог на рельсе с минимальным функционалом
(один автор, который выкладывает посты. Комментарии, сортировки,
фильтры и основные рюшечки не обязательны, но остаются на ваше усмотрение и желание.
Как и стилизация)
Выложить проект на Heroku

### Реализация
Настроено CI/CD:
- при загрузке на гитхаб прогоняются тесты/линтеры
- при пуше/коммите в основную ветку main автоматически происходит деплой в Heroku
[Ссылка на развёрнутое приложение](https://for-uchi-ru-product.herokuapp.com/posts)

Инстукция для локального развёртывания:
```bash
bundle install
bundle exec rails db:prepare
bundle exec rails server
```

* Ruby version: 3.1
* Ruby on Rails version: 7.0.1
