/*** This Program Creates All Temp Tables Needed to run departmentals ***/
/*** Run This First!!! ***/
/*** Remember to drop tables when you're done with this ***/

/*** make original temp table ***/
create table a_temp_jrod_blah_2
(
id_number       varchar2(10) not null,
xsequence       number(1)  not null,
dept_code       varchar2(10)  null,
degree_year     varchar2(10)  null,
degree_type     varchar2(2)   null,
degree_type_desc varchar(70)  null,
degree_desc      varchar(70) null,
pref_name       varchar(70)  null,
name_sort       varchar(70)  null,
pref_jnt_mail_name  varchar(70) null,
gender_code     varchar2(1)  null,
a_ask           varchar(30)  null,
flag_sport      number(1)    null,
flag_married    number(1)    null,
flag_married_same    number(1) null,
spouse_id       varchar2(10) null,
dept_segment    varchar2(20) null,
salutation      varchar2(70) null,
jnt_salutation  varchar2(70) null);
commit;
/

/*** Add values***/
insert into a_temp_jrod_blah_2 (id_number,
                              xsequence,
                              dept_code,
                              degree_year,
                              degree_type,
                              degree_type_desc,
                              degree_desc,
                              pref_name,
                              name_sort,                             
                              pref_jnt_mail_name,
                              gender_code,
                              a_ask,
                              spouse_id,
                              salutation,
                              jnt_salutation)
                              (select 
                               d.id_number, 
                               d.xsequence, 
                               d.dept_code, 
                               d.degree_year,
                               d.degree_type,
                               d.degree_type_desc,
                               d.degree_desc,
                               n.pref_name, 
                               n.name_sort,                              
                               e.pref_jnt_mail_name1,
                               e.gender_code,
                               a.a_ask,
                               e.spouse_id_number,
                               e.salutation,
                               e.jnt_salutation
        from   a_dw_degrees                     d,
               name                             n,
               a_aga_3                          a,
               entity                           e
       where  a.id_number                      = n.id_number
         and  d.id_number                      = e.id_number
         and  e.id_number                   = n.id_number
         and  d.dept_code         IN ('CHEM','CPR','ECON','ENG','ENV','GEOL','GEOP','MATH','MATSC','MET','MIN','PET','PHY')
         and  d.institution_code               = '1'
         and  n.name_type_code                 = '00'
         and  n.id_number IN
            (SELECT id_number
               FROM a_dw_address_good
              WHERE record_type_code = 'AL'
                AND flag_dns         = '0'
                AND flag_omit_from_mail = '0'));
COMMIT;
/

/*** Delete Reunion and PC People ***/
delete from a_temp_jrod_blah_2
where id_number in
    (select id_number 
       from a_aga_3
      where a_segment like '%reun%'
         or a_segment like '%pc%');
commit;
/

/*** Delete All Graduate degrees when person has Grad and Undergrad degree ***/
delete from a_temp_jrod_blah_2
where degree_type = 'G'
and id_number in
    (select id_number
       from a_temp_jrod_blah_2
      where degree_type = 'U');
commit;
/

/*** Delete all except first Graduate degree***/
delete from a_temp_jrod_blah_2
where degree_type = 'G'
and xsequence <> '1';
commit;
/

/*** Delete all except first Undergraduate degree***/
delete from a_temp_jrod_blah_2
where degree_type = 'U'
and xsequence <> '1';
commit;
/

/*** Delete CFY Donors ***/
delete from a_temp_jrod_blah_2
where id_number in
    (select id_number
       from a_dw_pyramid
      where flag_cfy = 1);
commit;
/

/*** Delete Spouse ID where spouse isn't solicitable ***/
update a_temp_jrod_blah_2
set spouse_id = ' ' 
where spouse_id NOT IN
    (select id_number
       from a_temp_jrod_blah_2);
commit;
/

/*** Update Athletic Flag ***/
update a_temp_jrod_blah_2
set flag_sport = '1'
where id_number in
    (select id_number from sport);
commit;
/

/** Update Nulls ***/
update a_temp_jrod_blah_2
set flag_sport = '0'
where flag_sport IS NULL;
commit;
/

/*** Update Married Flag ***/
update a_temp_jrod_blah_2
   set flag_married = '1'
 where id_number in
    (select id_number
       from entity
      where spouse_id_number in
        (select id_number
           from a_temp_jrod_blah_2));
commit;
/

/*** Update Married Flag Nulls ***/
update a_temp_jrod_blah_2
set    flag_married = '0'
where flag_married IS NULL;
commit;
/

/*** Update flag_married_same field***/
/*** Where the husband and wife have a degree from same department ***/
update a_temp_jrod_blah_2
set flag_married_same = '1'
where id_number in
    (select id_number
from a_temp_jrod_blah_2   j1
where flag_married = '1'
and j1.dept_code in
    (select j2.dept_code
       from a_temp_jrod_blah_2    j2
      where j1.spouse_id = j2.id_number));
commit;
/

/*** Update flag_married_same nulls ****/
/*** 0 means a husband and wife have at least 1 degree between them that is in a dept. different from the other ***/
update a_temp_jrod_blah_2
set flag_married_same = '0'
where flag_married_same IS NULL;
commit;
/

/*** Update salutation to jnt_salutation when hubby and wife get the same letter ***/
update a_temp_jrod_blah_2
set salutation = jnt_salutation
where flag_married_same = '1';
commit;
/      
 
/*** drop temp table 
drop table a_temp_jrod_blah_2;
commit;
/

