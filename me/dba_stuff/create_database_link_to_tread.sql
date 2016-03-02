CREATE DATABASE LINK tread
CONNECT TO ADVANCE IDENTIFIED BY Phate6211
USING   '(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = OIA-0210)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = tread)
    )
  )';

/***
select pref_class_year from entity@tread
where id_number = '0000033568';

select pref_class_year from entity
where id_number = '0000033568';
***/