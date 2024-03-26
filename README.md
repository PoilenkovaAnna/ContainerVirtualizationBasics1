# Практическая работа 1 
## "Основы контейнерной виртуализации"



## Цель
Научиться работать с Docker-контейнерами (далее просто контейнеры). Реализовать взаимодействие между сервисом и базой данных (БД), развернутыми в разных контейнерах.
## Описание задания
Реализовать приложение (к примеру с использованием python Flask), запустить его внутри контейнера. Развернуть БД mysql (или redis) внутри другого контейнера. Контейнеры собирать и запускать посредством Dockerfile (файл с описанием контейнера). Необходимо развернуть сервис, состоящий из этих двух контейнеров, посредством Docker-compose файла. Для сохранения состояния данных контейнера с БД использовать docker volume

# Выполнение
В качестве приложения используется простой TODO менеджер
![Снимок экрана 2024-03-26 в 20 33 42](https://github.com/PoilenkovaAnna/ContainerVirtualizationBasics1/assets/55884243/afb83ad0-fcdc-4917-89b5-09f1c5d62f5c)

### Сборка:

базы данных 
``` 
docker build  -f db_dockerfile -t db .
```


приложения 
``` 
docker build -t app .
```

### Запуск мульти-контейнерного приложения
``` 
docker compose up -d 
```
остановка
``` 
docker compose stop
```

### Просмотр базы данных 
``` 
docker exec -it [id-container] mysql -p todos

```
запрос в базе
``` 
select * from todo_items;
```

Запущенные контейнеры с помощью Docker-compose файла:

![image](https://github.com/PoilenkovaAnna/ContainerVirtualizationBasics1/assets/55884243/b5fe19f8-7911-4293-a485-c4d5cefac8d6)

Демонстрация сохранения данных в Database после завершения работы контейнеров:
![image](https://github.com/PoilenkovaAnna/ContainerVirtualizationBasics1/assets/55884243/891d7c88-dff7-49b6-bbff-94a2e684d3b7)



Изменение Database после взаимодействия с приложением:
- Выполнение одной из задач в TODO списке

<img width="482" alt="image" src="https://github.com/PoilenkovaAnna/ContainerVirtualizationBasics1/assets/55884243/cedd9087-5f40-45d1-a491-d44f9f01d851">

