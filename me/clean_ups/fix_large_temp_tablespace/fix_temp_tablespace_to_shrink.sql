/*** Fix Large Temp Tablespace ***/

CREATE TEMPORARY TABLESPACE TEMP2
    TEMPFILE SIZE 500M AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1024K
    
    SEGMENT SPACE MANAGEMENT MANUAL
/


alter database default temporary tablespace TEMP2;

/*** Note - this next step can take quite awhile to drop the tablespace, at least an hour sometimes ***/
/*** May need to bounce database to get the below drop to work ***/
drop tablespace temp including contents and datafiles;

CREATE TEMPORARY TABLESPACE TEMP
    TEMPFILE SIZE 500M AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1024K
    
    SEGMENT SPACE MANAGEMENT MANUAL
/

alter database default temporary tablespace TEMP;

drop tablespace temp2 including contents and datafiles;