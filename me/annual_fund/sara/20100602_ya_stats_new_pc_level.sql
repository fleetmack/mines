/*** NOTES ***/
/*** CASH field of temp_sara_ya DOES NOT use associated_amount_joint as to not double up, a_ag_summary_report DOES use joint ***/
/*** I AM using joint in calculating who is the the yapc_100_to_200, yapc_200_to_300, etc. fields ***/
/*** I am counting all behalf gifts in these counts as well -- this holds true in a_ag_summary_report ***/
/*** Sometimes the numbers os 100_to_200, 200_to_300, etc. will not add up to the total PC as they are given PC because the SPOUSE graduated later and met Young PC date, but the other graduated too long ago ***/
/*** I am using 10 years for this instead of the 9 years that is used in a_ag_summary_report, so for FY10, this uses class years 2000 - 2009 whereas a_ag_summary_repot uses 2001 to 2009 - that's why quantities of people are higher***/
/*** May want to ask John why he is using cash + joint in a_ag_summary_report as I'm pretty sure this double-counts ***/
drop table temp_sara_ya;
commit;

create table temp_sara_ya
(fiscal_year  varchar2(4),
total_pc_donors  number(3),
cash  number(12,2),
cash_plus_joint  number(12,2),
match number(12,2),
total_randall number(3),
total_van_tuyl number(3),
total_hill number(3),
total_stratton number(3),
total_gugg number(3),
yapc_100_to_200 number(3),
yapc_200_to_300 number(3),
yapc_300_to_400 number(3),
yapc_400_to_500 number(3),
yapc_500_to_600 number(3),
yapc_600_to_700 number(3),
yapc_700_to_800 number(3),
yapc_800_to_900 number(3),
yapc_900_to_1000 number(3),
yapc_1000_and_up number(3));
commit;

insert into temp_sara_ya (fiscal_year) values ('1990');
insert into temp_sara_ya (fiscal_year) values ('1991');
insert into temp_sara_ya (fiscal_year) values ('1992');
insert into temp_sara_ya (fiscal_year) values ('1993');
insert into temp_sara_ya (fiscal_year) values ('1994');
insert into temp_sara_ya (fiscal_year) values ('1995');
insert into temp_sara_ya (fiscal_year) values ('1996');
insert into temp_sara_ya (fiscal_year) values ('1997');
insert into temp_sara_ya (fiscal_year) values ('1998');
insert into temp_sara_ya (fiscal_year) values ('1999');
insert into temp_sara_ya (fiscal_year) values ('2000');
insert into temp_sara_ya (fiscal_year) values ('2001');
insert into temp_sara_ya (fiscal_year) values ('2002');
insert into temp_sara_ya (fiscal_year) values ('2003');
insert into temp_sara_ya (fiscal_year) values ('2004');
insert into temp_sara_ya (fiscal_year) values ('2005');
insert into temp_sara_ya (fiscal_year) values ('2006');
insert into temp_sara_ya (fiscal_year) values ('2007');
insert into temp_sara_ya (fiscal_year) values ('2008');
insert into temp_sara_ya (fiscal_year) values ('2009');
insert into temp_sara_ya (fiscal_year) values ('2010');
commit;

CREATE OR REPLACE PROCEDURE update_ya_stats
    (y_fiscal_year IN varchar2,
     y_pc_code IN varchar2)
IS
   y_count        varchar2(255);
   y_cash         varchar2(2555); 
   y_cash_plus_joint         varchar2(2555); 
   y_match       varchar2(2555);
   y_randall      varchar2(2555);
   y_van_tuyl   varchar2(2555);
   y_hill            varchar2(2555);
   y_stratton     varchar2(2555);
   y_gugg         varchar2(2555);
   y_100           varchar2(2555);
   y_200           varchar2(2555);
   y_300           varchar2(2555);
   y_400           varchar2(2555);
   y_500           varchar2(2555);
   y_600           varchar2(2555);
   y_700           varchar2(2555);
   y_800           varchar2(2555);
   y_900           varchar2(2555);
   y_1000           varchar2(2555);
BEGIN
y_count := 'UPDATE temp_sara_ya
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
y_cash := 'UPDATE temp_sara_ya
                SET cash = 
                (select sum(associated_amount) from a_dw_pyramid where flag_alumni = 0 '||
                ' and flag_non_monthend = 0 '||
                ' and id_number in (select id_number from a_dw_gift_clubs where '||
                y_pc_code||
                ' = 1'||
                ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||
                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
                ' and record_type_code = '||
                CHR(39)||
                'AL'||
                CHR(39)||
                ')) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';          
y_cash_plus_joint := 'UPDATE temp_sara_ya
                SET cash_plus_joint = 
                (select sum(associated_amount+associated_amount_joint) from a_dw_pyramid where flag_alumni = 0 '||
                ' and flag_non_monthend = 0 '||
                ' and id_number in (select id_number from a_dw_gift_clubs where '||
                y_pc_code||
                ' = 1'||
                ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||
                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
                ' and record_type_code = '||
                CHR(39)||
                'AL'||
                CHR(39)||
                ')) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';          
y_match := 'UPDATE temp_sara_ya
                SET match = 
                (select sum(associated_amount_match + associated_amount_claim) from a_dw_pyramid where flag_alumni = 0'||   
                ' and flag_non_monthend = 0 '||
                ' and id_number in (select id_number from a_dw_gift_clubs where '||
                y_pc_code||
                ' = 1 '||
                ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
                ' and record_type_code = '||
                CHR(39)||
                'AL'||
                CHR(39)||
                ')) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';        
y_randall :=
    'update temp_sara_ya
    set total_randall =    
    (select count(id_number) 
          from a_dw_gift_clubs
       where '||
        y_pc_code||
        ' = '||
        CHR(39)||
         '1'||
         CHR(39)||
             ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 '||
              'and record_type_code = '||
                CHR(39)||
                 'AL'||
                 CHR(39)||
               ' and id_number IN
                     (select id_number from a_dw_pyramid where flag_alumni = 0 '||
                ' and flag_non_monthend = 0 '||
               'and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||
                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
              ' group by id_number
              having sum(associated_amount+associated_amount_match+associated_amount_claim) < 2500)) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';        
y_van_tuyl :=
    'update temp_sara_ya
    set total_van_tuyl =    
    (select count(id_number) 
          from a_dw_gift_clubs
       where '||
        y_pc_code||
        ' = '||
        CHR(39)||
         '1'||
         CHR(39)||
             ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 '||
              'and record_type_code = '||
                CHR(39)||
                 'AL'||
                 CHR(39)||
               ' and id_number IN
                     (select id_number from a_dw_pyramid where flag_alumni = 0 '||
                ' and flag_non_monthend = 0 '||
               'and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||
                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
              ' group by id_number
              having sum(associated_amount+associated_amount_match+associated_amount_claim) BETWEEN 2500 and 4999.99)) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';   
y_hill :=
    'update temp_sara_ya
    set total_hill =    
    (select count(id_number) 
          from a_dw_gift_clubs
       where '||
        y_pc_code||
        ' = '||
        CHR(39)||
         '1'||
         CHR(39)||
             ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 '||
              'and record_type_code = '||
                CHR(39)||
                 'AL'||
                 CHR(39)||
               ' and id_number IN
                     (select id_number from a_dw_pyramid where flag_alumni = 0 '||
                ' and flag_non_monthend = 0 '||
                'and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||
                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
              ' group by id_number
              having sum(associated_amount+associated_amount_match+associated_amount_claim) BETWEEN 5000 and 9999.99)) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';   
y_stratton :=
    'update temp_sara_ya
    set total_stratton =    
    (select count(id_number) 
          from a_dw_gift_clubs
       where '||
        y_pc_code||
        ' = '||
        CHR(39)||
         '1'||
         CHR(39)||
             ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 '||
              'and record_type_code = '||
                CHR(39)||
                 'AL'||
                 CHR(39)||
               ' and id_number IN
                     (select id_number from a_dw_pyramid where flag_alumni = 0 '||
                ' and flag_non_monthend = 0 '||
                 'and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||
                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
              ' group by id_number
              having sum(associated_amount+associated_amount_match+associated_amount_claim) BETWEEN 10000 and 24999.99)) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';   
y_gugg :=
    'update temp_sara_ya
    set total_gugg =    
    (select count(id_number) 
          from a_dw_gift_clubs
       where '||
        y_pc_code||
        ' = '||
        CHR(39)||
         '1'||
         CHR(39)||
             ' and pref_class_year BETWEEN '||
                 CHR(39)||
                y_fiscal_year||
                CHR(39)||
                '-10 AND '||
                CHR(39)||
                y_fiscal_year||CHR(39)||'-1 '||
              'and record_type_code = '||
                CHR(39)||
                 'AL'||
                 CHR(39)||
               ' and id_number IN
                     (select id_number from a_dw_pyramid where flag_alumni = 0 '||
                ' and flag_non_monthend = 0 '||
               'and date_of_record between '||
                CHR(39)||
                to_number(y_fiscal_year - 1)||
                '0701'||
                CHR(39)||
                ' and '||
                    CHR(39)||
                    y_fiscal_year||
                    '0630'||
                    CHR(39)||
              ' group by id_number
              having sum(associated_amount+associated_amount_match+associated_amount_claim) >= 25000)) where fiscal_year = '||
                CHR(39)||
                y_fiscal_year||
                 CHR(39)||
                    '';   
y_100 := 
'update temp_sara_ya
set yapc_100_to_200 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 100 and 199.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';
y_200 := 
'update temp_sara_ya
set yapc_200_to_300 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 200 and 299.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';
y_300 := 
'update temp_sara_ya
set yapc_300_to_400 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 300 and 399.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';

y_400 := 
'update temp_sara_ya
set yapc_400_to_500 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 400 and 499.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';

y_500 := 
'update temp_sara_ya
set yapc_500_to_600 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 500 and 599.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';

y_600 := 
'update temp_sara_ya
set yapc_600_to_700 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 600 and 699.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';

y_700 := 
'update temp_sara_ya
set yapc_700_to_800 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 700 and 799.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';

y_800 := 
'update temp_sara_ya
set yapc_800_to_900 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 800 and 899.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';

y_900 := 
'update temp_sara_ya
set yapc_900_to_1000 =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) between 900 and 999.99))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';

y_1000 := 
'update temp_sara_ya
set yapc_1000_and_up =
    (select count(g.id_number)
       from a_dw_gift_clubs g
       where  g.pref_class_year BETWEEN '||
       to_number(y_fiscal_year - 10)||
     ' and '||
      to_number(y_fiscal_year - 1)||
           ' and g.record_type_code = '||
       CHR(39)||'AL'||CHR(39)||
           'and '||
           y_pc_code||
           ' = 1
           and g.id_number IN
                (select id_number
                    from a_dw_pyramid
                  where flag_alumni = 0
                     and flag_non_monthend = 0
                     and date_of_record BETWEEN '||
                     CHR(39)||to_number(y_fiscal_year - 1)||'0701'||CHR(39)||
                     ' and '||
                     CHR(39)||y_fiscal_year||'0630'||CHR(39)||
                     'group by id_number
                     having sum(associated_amount + associated_amount_match + associated_amount_claim+associated_amount_joint) >= 1000))      
where fiscal_year =  '||
                CHR(39)||y_fiscal_year||CHR(39)||'';
EXECUTE IMMEDIATE y_count;
EXECUTE IMMEDIATE y_cash;
EXECUTE IMMEDIATE y_cash_plus_joint;
EXECUTE IMMEDIATE y_match;
EXECUTE IMMEDIATE y_randall;
EXECUTE IMMEDIATE y_van_tuyl;
EXECUTE IMMEDIATE y_hill;
EXECUTE IMMEDIATE y_stratton;
EXECUTE IMMEDIATE y_gugg;
EXECUTE IMMEDIATE y_100;
EXECUTE IMMEDIATE y_200;
EXECUTE IMMEDIATE y_300;
EXECUTE IMMEDIATE y_400;
EXECUTE IMMEDIATE y_500;
EXECUTE IMMEDIATE y_600;
EXECUTE IMMEDIATE y_700;
EXECUTE IMMEDIATE y_800;
EXECUTE IMMEDIATE y_900;
EXECUTE IMMEDIATE y_1000;
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
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1999';
test_param2 := 'pc99';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1998';
test_param2 := 'pc98';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1997';
test_param2 := 'pc97';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1996';
test_param2 := 'pc96';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1995';
test_param2 := 'pc95';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1994';
test_param2 := 'pc94';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1993';
test_param2 := 'pc93';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1992';
test_param2 := 'pc92';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1991';
test_param2 := 'pc91';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/
DECLARE
test_param1 VARCHAR2(4);
test_param2 VARCHAR2(4);
BEGIN
test_param1 := '1990';
test_param2 := 'pc90';
 update_ya_stats(test_param1, test_param2);
commit;
end;
/

select * from temp_sara_ya;