/***
Get stewarded allocations with the adminitrator and steward id
***/

select id_number, pref_mail_name, pref_name_sort, salutation
from entity
where id_number in
(
select distinct steward_id_number
from allocation
where allocation_code in
    (select allocation from a_stew_main_9)
and steward_id_number > ' '
union 
select distinct assignment_id_number
from assignment
where allocation_code IN (select allocation from a_stew_main_9)
)