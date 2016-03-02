select id_number, pref_mail_name,record_type_code, sum(associated_amount)
from a_dw_pyramid
where date_of_record between '20020223' and '20020516'
 and person_or_org = 'O'
 and flag_behalf = 0
 and transaction_type <> 'MG'
group by id_number, pref_mail_name,record_type_code
having sum(associated_amount)>= 25000
order by sum(associated_amount) desc;

