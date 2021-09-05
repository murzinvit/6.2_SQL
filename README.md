### 6.2_SQL
--------------------------------------------------------------------
### Задача 1: </br>
Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume: </br>
1) `docker pull postgres` </br>
2) `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=pass -e POSTGRES_USER=user -e POSTGRES_DB=netology -v /DATABASE/postgres-data:/var/lib/postgreql/data -v /DATABASE/postgres-backup:/mnt --name postgres_srv postgres` </br>

### Задача 2: </br>
1) Создайте пользователя test-admin-user и БД test_db: `CREATE USER test_admin_user;` , `CREATE DATABASE test_db;` </br>
2) В БД test_db создайте таблицу orders и clients:  </br>
- `CREATE TABLE orders (id serial, title varchar(255), price integer, PRIMARY KEY (id));` </br>
- `CREATE TABLE clients (id serial PRIMARY KEY,family varchar(255),country varchar(255),FOREIGN KEY (id) REFERENCES orders);`</br>

3) Дать все привилегии пользователю test-admin-user на таблицы БД test_db: `grant all privileges on database test_db to test_admin_user;`</br>
4) Cоздайте пользователя test-simple-user: `CREATE USER test_simple_user;` </br>
5) Предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db: </br>
- `GRANT ALL PRIVILEGES ON test_db TO test_simple_user;`</br>
