### 6.2_SQL
--------------------------------------------------------------------
### Задача 1: </br>
1)Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume: </br>
- `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=pass -e POSTGRES_USER=user -e POSTGRES_DB=netology -v /DATABASE/postgres-data:/var/lib/postgreql/data -v /DATABASE/postgres-backup:/mnt --name postgres_srv postgres:latest` </br>

### Задача 2: </br>
1) Создайте пользователя test-admin-user и БД test_db: </br>
- `CREATE USER test_admin_user;` </br>
- `CREATE DATABASE test_db;` </br>
3) В БД test_db создайте таблицу orders и clients:  </br>
- `CREATE TABLE orders (id SERIAL PRIMARY KEY, title CHARACTER VARYING(80), price INTEGER DEFAULT 0);` </br>
- `CREATE UNIQUE INDEX title_idx ON orders (title);`
- `CREATE TABLE clients (id SERIAL PRIMARY KEY,family_name character varying(80),country character varying(80),complite_order integer, FOREIGN KEY (complite_order) REFERENCES orders (title));`</br>
- [Документация](https://postgrespro.ru/docs/postgrespro/9.5/sql-createindex) по индексам </br>
4) Дать все привилегии пользователю test-admin-user на таблицы БД test_db: `</br>
- `grant all privileges on database test_db to test_admin_user;` </br>
5) Cоздайте пользователя test-simple-user:  </br>
- `CREATE USER test_simple_user;` </br>
6) Предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db: </br>
- `\connect test_db` </br>
- `GRANT SELECT,INSERT,UPDATE,DELETE ON orders, clients TO test_simple_user;`</br>
Результат: </br>
1)Итоговый список БД после выполнения пунктов выше: </br>
![screen](https://github.com/murzinvit/screen/blob/f60667ff463698d45bc84c20e23e20f6945558d1/SQL_list_db.png) </br>
2) Описание таблиц (describe): </br>
![SQL_describe_orders](https://github.com/murzinvit/screen/blob/9b884616822cfa0d214a2b7057e8a9579a842ffa/SQL_describe_orders.png) </br>
------------------------------------------------------------------------------------------------------------
![SQL_describe_clients](https://github.com/murzinvit/screen/blob/09f75ec59d8fed5098230460d44c76f3e9680f35/SQL_describe_clients.png) </br>
3) SQL-запрос для выдачи списка пользователей с правами над таблицами test_db: <br> `SELECT datname,datact from pg_catalog.pg_user where datname = 'test_db';` <br>
4) Cписок пользователей с правами над таблицами test_db: </br>
![screen](https://github.com/murzinvit/screen/blob/607b29aae48f5b2f43299376b81a279bca409b95/SQL_acl_test_db.png) </br>
### Задача 3: </br>
1) Используя SQL синтаксис - наполните таблицы следующими тестовыми данными: </br>
- Пример: `insert into orders (title, price) values ('Chocolate', 10);` </br>
2) Вычислите количество записей для каждой таблицы: </br>
- `select count(id) from orders` </br>
![screen](https://github.com/murzinvit/screen/blob/df5aa6d208e5daaa6b8a49b5e633feeb0103910c/SQL_select_count_id_clients.png) </br>
- `select count(id) from clients` </br>
![screen](https://github.com/murzinvit/screen/blob/08a6c8f79e50210a3a5621ba555cadadb4850899/SQL_select_count_id_orders.png) </br>
#### Задача 4: </br>
1) Используя foreign keys свяжите записи из таблиц, согласно таблице: </br>

#### Задача 5: </br>

#### Задача 6: </br>

--------------------------------------------------------------------------- </br>
Рабочие заметки: </br>
Database backup: [test_db.sql](https://github.com/murzinvit/6.2_SQL/blob/30c37f35c5f85647e10a59693291f62b6c49d328/test_db.sql) </br>
pg_dump -U user -F c test_db > /mnt/test_db.sql </br>
pg_restore -U user -d test_db -f test_db.sql </br>
