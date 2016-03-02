create table a_temp_wenger_blah
as
select id_number, pref_mail_name, pref_name_sort, transaction_type, associated_amount, associated_amount_match, associated_amount_claim, total_commitment, alloc
from a_dw_pyramid
where transaction_type in ('BQ','PP','P','GF')
and date_of_record between '20020701' and '20030630'
and flag_alumni = 0
and person_or_org = 'P'
and (associated_amount + associated_amount_match + associated_amount_claim >= 100000
      or total_commitment >= 100000);
commit;
/


insert into a_temp_wenger_blah
select id_number, pref_mail_name, pref_name_sort, transaction_type, associated_amount, associated_amount_match, associated_amount_claim, total_commitment, alloc
from a_dw_pyramid
where transaction_type in ('BQ','PP','P','GF')
and date_of_record between '20020701' and '20030630'
and flag_alumni = 0
and person_or_org = 'P'
and id_number NOT IN 
   (select id_number from a_temp_wenger_blah)
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 100000
group by id_number, pref_mail_name, pref_name_sort, transaction_type, associated_amount, associated_amount_match, 
associated_amount_claim, total_commitment, alloc;
COMMIT;
/


delete from a_temp_wenger_blah
where id_number in
(select id_number from a_dw_pyramid where person_or_org = 'O')
commit;
/


select * from a_temp_wenger_blah

drop table a_temp_wenger_blah;
commit;
/
