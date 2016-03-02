rem !!! Password changed so it doesn't accidentally run !!!

impdp advance/PASSWORD@testing DIRECTORY=DATA_PUMP_DIR TABLE_EXISTS_ACTION=REPLACE LOGFILE=import_table.log dumpfile=GiantChicken_A_ZZ_USER_TABLES.dmp tables=(ZZ_USER,ZZ_USER_RIGHTS,ZZ_USER_PREF,ZZ_USER_ALIAS,ZZ_USER_GROUP)                                                               
                                                                                
