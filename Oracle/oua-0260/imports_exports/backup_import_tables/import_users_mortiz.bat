rem
rem Imports Advance Users
rem


imp userid=advance/blah@mortiz file="D:\imports_exports\backup_export_tables\ZZ_USER.dmp" fromuser=advance touser=advance log="D:\imports_exports\log_backup_tables_import\ZZ_USER.log" ignore=Y full=N grants=N indexes=Y rows=Y buffer=60000
imp userid=advance/blah@mortiz file="D:\imports_exports\backup_export_tables\ZZ_USER_RIGHTS.dmp" fromuser=advance touser=advance log="D:\imports_exports\log_backup_tables_import\ZZ_USER_RIGHTS.log" ignore=Y full=N grants=N indexes=Y rows=Y buffer=60000
