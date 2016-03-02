select * from a_dw_assignment
where a_dw_assignment.ass_id_number in
(select a_dw_address_good.id_number from a_dw_address_good
where a_dw_address_good.id_number in
(select id_number 
from committee
where committee_code in ('PCVDE','PCVH','PCVNT','PCVO','PCVSC')
AND committee_status_code    = 'A')
or id_number = 12568);


select id_number
from a_dw_address_good
where id_number in
(select id_number from committee
where committee_code in ('PCVDE','PCVH','PCVNT','PCVO','PCVSC')
and stop_dt = '20030630')
or id_number = '0000012568'
or id_number = '0000009085'
order by pref_name_sort


select * from a_dw_address_good where id_number = 12568
