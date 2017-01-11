del d:\imports_exports\data_pump\ADVANCE10G_6.DMP
del d:\imports_exports\data_pump\export_schema.log
ren d:\imports_exports\data_pump\ADVANCE10G_5.DMP   ADVANCE10G_6.DMP
ren d:\imports_exports\data_pump\ADVANCE10G_4.DMP   ADVANCE10G_5.DMP
ren d:\imports_exports\data_pump\ADVANCE10G_3.DMP   ADVANCE10G_4.DMP
ren d:\imports_exports\data_pump\ADVANCE10G_2.DMP   ADVANCE10G_3.DMP
ren d:\imports_exports\data_pump\ADVANCE10G_1.DMP   ADVANCE10G_2.DMP
ren d:\imports_exports\data_pump\ADVANCE10G.DMP   ADVANCE10G_1.DMP


expdp advance/Phate6211 DIRECTORY=DATA_PUMP_DIR dumpfile=advance10g.dmp logfile=export_schema.log schemas=advance

copy /y d:\imports_exports\data_pump\ADVANCE10G.DMP d:\imports_exports\data_pump\dump_files\
copy /y d:\imports_exports\data_pump\ADVANCE10G_1.DMP d:\imports_exports\data_pump\dump_files\
copy /y d:\imports_exports\data_pump\ADVANCE10G_2.DMP d:\imports_exports\data_pump\dump_files\
copy /y d:\imports_exports\data_pump\ADVANCE10G_3.DMP d:\imports_exports\data_pump\dump_files\
copy /y d:\imports_exports\data_pump\ADVANCE10G_4.DMP d:\imports_exports\data_pump\dump_files\
copy /y d:\imports_exports\data_pump\ADVANCE10G_5.DMP d:\imports_exports\data_pump\dump_files\
copy /y d:\imports_exports\data_pump\ADVANCE10G_6.DMP d:\imports_exports\data_pump\dump_files\
copy /y d:\imports_exports\data_pump\export_schema.log d:\imports_exports\data_pump\dump_files\

copy /y d:\imports_exports\data_pump\ADVANCE10G.DMP \\oia-0210\d$\10g_imports\
copy /y d:\imports_exports\data_pump\ADVANCE10G_1.DMP \\oia-0210\d$\10g_imports\
copy /y d:\imports_exports\data_pump\ADVANCE10G_2.DMP \\oia-0210\d$\10g_imports\
copy /y d:\imports_exports\data_pump\ADVANCE10G_3.DMP \\oia-0210\d$\10g_imports\
copy /y d:\imports_exports\data_pump\ADVANCE10G_4.DMP \\oia-0210\d$\10g_imports\
copy /y d:\imports_exports\data_pump\ADVANCE10G_5.DMP \\oia-0210\d$\10g_imports\
copy /y d:\imports_exports\data_pump\ADVANCE10G_6.DMP \\oia-0210\d$\10g_imports\
copy /y d:\imports_exports\data_pump\export_schema.log \\oia-0210\d$\10g_imports\

