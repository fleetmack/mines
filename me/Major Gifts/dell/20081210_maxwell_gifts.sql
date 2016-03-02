/*** Number for Dell about endowment -- i told her hte numbers werne't exact as i was walking out the door when she asked ***/
select *
from allocation
where lower(long_name) like '%maxwell%'


select id_number, pref_mail_name, pref_name_sort, '$'||sum(total_jnt_commitment)
from a_dw_pyramid
where alloc IN '726'
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort
