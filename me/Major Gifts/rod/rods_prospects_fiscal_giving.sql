/*** Rod's Prospects ... FY06 ... $5000 or more (if you add the "having" line at the end ***/
select id_number, pref_mail_name, pref_name_sort, sum(associated_amount + associated_amount_match + associated_amount_claim)
from a_dw_pyramid
where id_number in
    (select id_number
       from a_dw_assignment
      where ass_id_number = '0000033218')
  and date_of_record BETWEEN '20050701' and '20060630'
group by id_number, pref_mail_name, pref_name_sort
--having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 5000