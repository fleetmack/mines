/*** Longest Consecutive Donor Stuff ***/

drop table temp_rosie;
commit;

create table temp_rosie
as
(select distinct id_number from a_dw_pyramid
where person_or_org = 'P'
and year_of_giving = '2008'
and flag_alumni <> '1'
and flag_memorial <> '1'
and transaction_type IN ('PP','GF'));

delete from temp_rosie
where id_number not in
(select id_number from a_dw_pyramid
where flag_alumni <> '1'
and year_of_giving = '1977'
and flag_memorial <> '1'
and transaction_type IN ('PP','GF'));
commit;


select e.id_number, e.pref_mail_name, e.pref_name_sort
 from temp_rosie t, 
entity e
where t.id_number = e.id_number