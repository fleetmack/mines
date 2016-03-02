create table temp_miriam
as
(select id_number
from a_dw_gift_clubs_pc
where pc00 = 1
and pc01 = 1
and pc02 = 1
and pc03 = 1
and pc04 = 1);
commit;
/

drop table temp_miriam;
commit;
/

delete from teMP_miriam
where id_number not in
    (select id_number
    from a_dw_address_good
    where flag_dns = 0)

select * from a_dw_address_good


delete from temp_miriam
where id_number in
(select id_number from committee
where committee_code = 'RGP'
and committee_status_code = 'A');
commit;
/

update temp_miriam  m
set m.pref_class_year = 
    (select a.pref_class_year
    from a_dw_address_good  a
    where a.id_number = m.id_number)


select * from temp_miriam

alter table temp_miriam
add pref_class_year varchar2(60) null;

insert into temp_miriam
(select id_number from committee
where (committee_code = 'RGP'
or committee_code like 'PC%')
and start_dt > '19990701'
and id_number NOT IN
    (select id_number from temp_miriam));
    commit;
    /
    
    
delete from temp_miriam
where id_number not in
    (select id_number from a_dw_address_good
    where p_flag_foreign = '1')