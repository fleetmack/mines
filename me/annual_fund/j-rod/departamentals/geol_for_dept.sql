/*** Geology dept needs to figure out who will get the newsletter that we aren't soliciting***/
/*** figure out marriages for their side ***/
/*** THIS RELIES ON a_temp_dept_mail HAVING BEEN RUN ***/
   
drop table a_temp_geol_all    
as
select distinct id_number
from a_dw_degrees
where dept_code = 'GEOL'
and id_number in
    (select id_number
      from a_dw_address_good
     where p_flag_foreign = '0');
commit;
/

/*** creates table of geol degrees who are not being solicited ***/
create table a_temp_geol_1
as
select id_number
from a_temp_geol_all
where id_number NOT IN
    (select id_number from a_temp_dept_mail
      where dept_code = 'GEOL');
commit;
/

/*** delete where spouse is already getting one from us ***/
delete from a_temp_geol_1
where id_number in
    (select spouse_id
      from a_temp_dept_mail
     where dept_code = 'GEOL');
commit;
/

 
/*** Soliciting single ***/
create table a_temp_geol_3
as
select id_number
from a_temp_geol_all
where id_number NOT IN
    (select id_number from a_temp_geol_1);
commit;
/

/*** Soliciting married ***/
create table a_temp_geol_4
as
select id_number
from a_temp_geol_3
where id_number in
    (select id_number
    from a_temp_dept_mail
    where dept_code = 'GEOL' 
    and flag_married = '1'
and flag_married_same = '1');
commit;
/

/*** delete married people from a_temp_geol_3 ***/
delete from a_temp_geol_3
where id_number in 
(select id_number from a_temp_geol_4);
commit;
/

/*** delete spouse from a_temp_geol_3 where spouse is in a_temp_geol_4 ***/
delete from a_temp_geol_3
where id_number in
    (select id_number
       from a_temp_dept_mail
      where spouse_id in
            (select id_number
               from a_temp_geol_4));
commit;
/

/*** Creates table of geol degrees who are married ***/
create table a_temp_geol_2
(
id_number       varchar2(10) not null,
flag_married    varchar2(1) null,
flag_married_same varchar2(1) null);
commit;
/

/*** import everyone from temp 1***/
insert into a_temp_geol_2
(id_number)
(select id_number from a_temp_geol_1); 
commit;
/

/*** Update Married Flag ***/
update a_temp_geol_2
   set flag_married = '1'
 where id_number in
    (select id_number
       from entity
      where spouse_id_number in
        (select id_number
           from a_temp_geol_2));
commit;
/

/*** Update Married Flag Nulls ***/
update a_temp_geol_2
set    flag_married = '0'
where flag_married IS NULL;
commit;
/

/*** delete where not married ***/
delete from a_temp_geol_2
where flag_married <> '1';
commit;
/


/*** Delete from a_temp_1 where they're married ***/
delete from a_temp_geol_1
where id_number in
    (select id_number from a_temp_geol_2);
commit;
/

/*** delete spouse from a_temp_geol_2 as they only get one letter per household ***/
delete from a_temp_geol_2
where id_number in
    (select id_number
    from entity
    where gender_code = 'F');
commit;
/

    
    /*** everybody before broken down ***/
    drop table a_temp_geol_all;
    commit;
    /
    
    /*** not soliciting single ***/
     drop table a_temp_geol_4;
      commit;
    /
    
    /*** not soliciting married ***/
     drop table from   commit;
    /
    
    
    /*** Soliciting single ***/
     select * from   commit;
    /
    
    
    /*** Soliciting married ***/
     select * from a_temp_geol_4
     
      commit;
    /
    