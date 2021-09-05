### 6.2_SQL
--------------------------------------------------------------------
### Задача 1: </br>
Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume: </br>
1) `docker pull postgres` </br>
2) `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=pass -e POSTGRES_USER=user -e POSTGRES_DB=netology -v /DATABASE/postgres-data:/var/lib/postgreql/data -v /DATABASE/postgres-backup:/mnt --name postgres_srv postgres` </br>

### Задача 2: </br>
1) создайте пользователя test-admin-user и БД test_db: `CREATE USER test_admin_user WITH PASSWORD = 'pass';` </br>
2) в БД test_db создайте таблицу orders и clients: `CREATE DATABASE test_db;` </br>
3) предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db: </br>
4) создайте пользователя test-simple-user: </br>
5) предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db: </br>

