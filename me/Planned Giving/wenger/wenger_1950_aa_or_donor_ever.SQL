/*** Creates temp table with all alumni from 1950 or earlier - exclude heritage society members***/

create table a_temp_heritage_blah as

select id_number from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year <= 1951
and id_number not in
    (select id_number
       from a_dw_gift_clubs
      where heritage_society = 1);
commit;
/



/*** selects those who have ever made a gift or have ever been an AA member ***/
select distinct id_number from a_temp_heritage_blah
where id_number in
    (select id_number from a_dw_pyramid)
or id_number in
    (select id_number from a_dw_memb);
commit;
/



/*** Drops Temp Table ***/
drop table a_temp_heritage_blah;
commit;
/



