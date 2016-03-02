select id_number, sum(associated_amount + associated_amount_match + associated_amount_claim)
from a_dw_pyramid
where date_of_record between '20040701' and '20050630'
 and person_or_org = 'P'
 and flag_alumni = 0
group by id_number, pref_mail_name,record_type_code
having sum(total_jnt_cash)<= 25000;




