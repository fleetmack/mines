CREATE OR REPLACE PROCEDURE update_ya_stats
    (y_fiscal_year IN varchar2,
     y_pc_code IN varchar2)
IS
   y_sql        varchar2(255);
BEGIN
y_sql := 'UPDATE temp_sara_ya
SET total_pc_donors =
(SELECT count(id_number)
FROM a_dw_gift_clubs
WHERE pref_class_year BETWEEN '||
CHR(39)||y_fiscal_year||CHR(39)||
'-10 AND '||
CHR(39)||y_fiscal_year||CHR(39)||
'-1 AND record_type_code = ''AL'' AND '||y_pc_code||'  =''1'') WHERE fiscal_year = '||
CHR(39)||y_fiscal_year||CHR(39)||
'';
EXECUTE IMMEDIATE y_sql;
END;
/

DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2010';
test_param2 := 'pc10';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2009';
test_param2 := 'pc09';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2008';
test_param2 := 'pc08';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2007';
test_param2 := 'pc07';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2006';
test_param2 := 'pc06';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2005';
test_param2 := 'pc05';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2004';
test_param2 := 'pc04';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2003';
test_param2 := 'pc03';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2002';
test_param2 := 'pc02';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2001';
test_param2 := 'pc01';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '2000';
test_param2 := 'pc00';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/