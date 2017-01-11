rem *******************************
rem Runs 3 batch files needed to create the overnights
rem This relies upon the following batches to exist
rem d:\imports_exports\data_pump\_nightly_table_dump_prereq.bat
rem d:\imports_exports\data_pump\_datapump_mortiz_nightly_export_tables_1_file.bat
rem d:\imports_exports\data_pump\_nightly_table_dump_postreq.bat

d:\imports_exports\data_pump\_nightly_table_dump_prereq.bat
d:\imports_exports\data_pump\_datapump_nightly_mortiz_export_tables_1_file.bat
d:\imports_exports\data_pump\_nightly_table_dump_postreq.bat