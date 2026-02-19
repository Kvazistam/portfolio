#!/bin/bash

# Остановка скрипта при ошибке
set -e
rm -rf public
# Генерация статических файлов
hugo

# Переход в папку public
cd public


# Проверка и удаление существующего удалённого репозитория
if git remote get-url origin &>/dev/null; then
  git remote remove origin
fi

# Инициализация git и настройка удалённого репозитория
git init
git add .
git commit -m "Deploy site"

# Добавление удалённого репозитория через SSH и публикация
git branch -M main
git remote add origin git@github.com:kvazistam/portfolio.git
git push -f origin main:gh-pages

# Возвращение в корневую папку
cd ..
