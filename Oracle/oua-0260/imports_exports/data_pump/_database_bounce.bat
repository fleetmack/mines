rem *********************************************************
rem Shuts Down Giggidy
rem *********************************************************

net stop "OracleServiceMORTIZ" >> D:\imports_exports\data_pump\mortiz_down.txt

net start "OracleServiceMORTIZ" >> D:\imports_exports\data_pump\mortiz_up.txt

exit
