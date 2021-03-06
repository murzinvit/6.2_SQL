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
- `CREATE TABLE clients (id SERIAL PRIMARY KEY,family_name character varying(80),country character varying(80),complite_order character varying(80), FOREIGN KEY (complite_order) REFERENCES orders (title));`</br>
- [Документация](https://postgrespro.ru/docs/postgrespro/9.5/sql-createindex) по индексам </br>
4) Дать все привилегии пользователю test-admin-user на таблицы БД test_db: `</br>
- `grant all privileges on database test_db to test_admin_user;` </br>
5) Cоздайте пользователя test-simple-user:  </br>
- `CREATE USER test_simple_user;` </br>
6) Предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db: </br>
- `\connect test_db;` </br>
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
- `insert into orders (title, price) values ('Chocolate', 10);` </br>
- `insert into orders (title, price) values ('Printer', 3000);` </br>
- `insert into orders (title, price) values ('Book', 500);` </br>
- `insert into orders (title, price) values ('Screen', 7000);` </br>
- `insert into orders (title, price) values ('Guitar', 4000);` </br>
- `insert into clients (family_name, country) values ('Ivanov.I.I', 'USA');` </br>
- `insert into clients (family_name, country) values ('Petrov.P.P', 'Canada');` </br>
- `insert into clients (family_name, country) values ('Bah.I.S', 'Japan');` </br>
- `insert into clients (family_name, country) values ('Dio.R.D', 'Russia');` </br>
- `insert into clients (family_name, country) values ('Blackmore.R', 'Russia');` </br>
2) Вычислите количество записей для каждой таблицы: </br>
- `select count(id) from orders` </br>
![screen](https://github.com/murzinvit/screen/blob/df5aa6d208e5daaa6b8a49b5e633feeb0103910c/SQL_select_count_id_clients.png) </br>
- `select count(id) from clients` </br>
![screen](https://github.com/murzinvit/screen/blob/08a6c8f79e50210a3a5621ba555cadadb4850899/SQL_select_count_id_orders.png) </br>
#### Задача 4: </br>
1) Используя foreign keys свяжите записи из таблиц, согласно таблице: </br>
- `update clients set complite_order = 'Book' where family_name = 'Ivanov.I.I';` </br>
- `update clients set complite_order = 'Screen' where family_name = 'Petrov.P.P';` </br>
- `update clients set complite_order = 'Guitar' where family_name = 'Bah.I.S';` </br>
2) Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод данного запроса: </br>
- `select family_name from clients where complite_order is not null;` </br>
![screen](https://github.com/murzinvit/screen/blob/10119e68197b556a2d4089e8c6258d92ebf18ba9/SQL_selectt_orders_complite.jpg)
#### Задача 5: </br>
Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 (используя директиву EXPLAIN): </br>
![screen](https://github.com/murzinvit/screen/blob/971f68f2df3805625536d2f961f5919ff2e402d6/SQL_Explain_select.jpg) </br>
Показан план для узла clients и пиблизительная оценка стоимости выполнения данного узла </br> 
#### Задача 6: </br>
1) Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов: </br>
- `pg_dump -U user -F c test_db > /mnt/test_db.sql` </br>
2) Остановите контейнер с PostgreSQL (но не удаляйте volumes) </br>
- `docker stop postgres_srv` </br>
3) Поднимите новый пустой контейнер с PostgreSQL: </br>
- `docker run -d -e POSTGRES_USER=user -v /DATABASE/postgres-data:/var/lib/postgreql/data -v /DATABASE/postgres-backup:/mnt --name postgres_srv postgres:latest` </br>
4) Восстановите БД test_db в новом контейнере: </br>
- `psql -U user template1` </br>
- `create database test_db;`, `exit` </br>
- `pg_restore -U user -d test_db < /mnt/test_db.sql` </br>
- `psql -U user test_db` </br>
--------------------------------------------------------------------------- </br>
