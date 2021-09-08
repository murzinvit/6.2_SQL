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
- `CREATE TABLE clients (id SERIAL PRIMARY KEY,family_name character varying(80),country character varying(80),FOREIGN KEY (id) REFERENCES orders);`</br>
- `CREATE UNIQUE INDEX title_idx ON orders (title);`

3) Дать все привилегии пользователю test-admin-user на таблицы БД test_db: `</br>
- `grant all privileges on database test_db to test_admin_user;`</br>
4) Cоздайте пользователя test-simple-user:  </br>
- `CREATE USER test_simple_user;` </br>
5) Предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db: </br>
- `GRANT ALL PRIVILEGES ON test_db TO test_simple_user;`</br>

### Задача 3: </br>
