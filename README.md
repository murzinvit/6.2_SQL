#№№ 6.2_SQL
--------------------------------------------------------------------
### Задача 1: </br>
Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume: </br>
1) `docker pull postgres` </br>
2) `docker run -d -p 5432 -e POSTGRES_PASSWORD=pass -e POSTGRE_USER=user -e POSTGRES_ DB=netology -v /DATABASE/postgres-data:/var/lib/postgreql/data -v /DATABASE/postgres-backup:/mnt --name postgre_srv postgres` </br>

### Задача 2: </br>
