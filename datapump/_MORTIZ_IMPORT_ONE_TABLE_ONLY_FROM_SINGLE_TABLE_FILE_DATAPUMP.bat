rem !!! Password changed so it doesn't accidentally run !!!

impdp advance/PASSWORD DIRECTORY=DATA_PUMP_DIR TABLE_EXISTS_ACTION=REPLACE LOGFILE=import_table.log dumpfile=mortiz_zz_adv_table.dmp tables=ZZ_ADV_TABLE  
                                                                                
