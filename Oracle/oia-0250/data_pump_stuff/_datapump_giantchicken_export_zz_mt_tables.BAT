del d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_6.DMP
del d:\imports_exports\data_pump\zz_mt\export_zz_mt_tables.log
ren d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_5.DMP   GIANTCHICKEN_ZZ_MT_TABLES_6.DMP
ren d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_4.DMP   GIANTCHICKEN_ZZ_MT_TABLES_5.DMP
ren d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_3.DMP   GIANTCHICKEN_ZZ_MT_TABLES_4.DMP
ren d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_2.DMP   GIANTCHICKEN_ZZ_MT_TABLES_3.DMP
ren d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_1.DMP   GIANTCHICKEN_ZZ_MT_TABLES_2.DMP
ren d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES.DMP   GIANTCHICKEN_ZZ_MT_TABLES_1.DMP

expdp advance/Phate6211@giantchicken VERSION=10.2 DIRECTORY=zz_mt_dump_files dumpfile=giantchicken_zz_mt_tables.dmp tables=('ZZ_MT_APP_FORMS','ZZ_MT_APP_MENU_ITEMS','ZZ_MT_APPS','ZZ_MT_APPS_OPTIONS','ZZ_MT_APPS_SECURITY','ZZ_MT_ATTACHMENT_MIME','ZZ_MT_AWC_MENU_TREE','ZZ_MT_AWC_MENU_TREE_PARAMETERS','ZZ_MT_CRYSTAL_REPORTS','ZZ_MT_DATA_CLUMP','ZZ_MT_DATA_CMD','ZZ_MT_DATA_PARAMS','ZZ_MT_DATA_UPLOAD_FIELD','ZZ_MT_DATA_UPLOAD_TABLE','ZZ_MT_DB','ZZ_MT_DRILLDOWN','ZZ_MT_DRILLDOWN_PARAMS','ZZ_MT_FORMS','ZZ_MT_FORMS_CONTROLS','ZZ_MT_FORMS_HEADER','ZZ_MT_FORMS_OPTIONS','ZZ_MT_FORMS_RELATIONS','ZZ_MT_FORMS_SECURITY','ZZ_MT_GOTO','ZZ_MT_GOTO_TYPES','ZZ_MT_HELP','ZZ_MT_LOOKUP_DETAIL','ZZ_MT_LOOKUP_HEADER','ZZ_MT_LOOKUP_SECURITY','ZZ_MT_MENU','ZZ_MT_MENU_ITEMS','ZZ_MT_MENU_TREE','ZZ_MT_MSGS','ZZ_MT_PAGE','ZZ_MT_PAGE_NAV_IMAGES','ZZ_MT_PAGE_NAV_TREE','ZZ_MT_PAGE_SECURITY','ZZ_MT_PROFILE','ZZ_MT_PROFILE_LEVEL','ZZ_MT_PT_SUMMARY_NODES','ZZ_MT_REPORTS','ZZ_MT_REPORTS_GROUP','ZZ_MT_REPORTS_SECURITY','ZZ_MT_SAVED_LOOKUP','ZZ_MT_SAVED_LOOKUP_DETAIL','ZZ_MT_SAVED_LOOKUP_FORM','ZZ_MT_SAVED_LOOKUP_RIGHT','ZZ_MT_SITE','ZZ_MT_SYSOPTIONS','ZZ_MT_TMS_ATTRIBUTES','ZZ_MT_TMS_HELP','ZZ_MT_TOKEN','ZZ_MT_USER_FORMS','ZZ_MT_USER_PROFILE','ZZ_RIGHTS_IDENTIFIER') logfile=export_zz_mt_tables.log

copy /y d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES.DMP \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\
copy /y d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_1.DMP \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\
copy /y d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_2.DMP \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\
copy /y d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_3.DMP \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\
copy /y d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_4.DMP \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\
copy /y d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_5.DMP \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\
copy /y d:\imports_exports\data_pump\zz_mt\GIANTCHICKEN_ZZ_MT_TABLES_6.DMP \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\
copy /y d:\imports_exports\data_pump\zz_mt\export_schema.log \\oia-0250\d$\imports_exports\data_pump\dump_files\zz_mt\

