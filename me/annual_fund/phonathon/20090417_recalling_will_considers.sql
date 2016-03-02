/*** Will Considers from previous semester of calling ***/
/*** Note: Ensure all refusals for this semester are up to date such that someone who was called this semester isnt' called again ***/
select id_number
from appeals
where appeal_code = 'PP09F'
and response_code = 'C'
and id_number NOT IN (select id_number from a_dw_pyramid where flag_alumni <> '1' and year_of_giving = '2009')
and id_number NOT IN (select id_number from appeals where appeal_code = 'PP09S' and response_code IN ('R','C'))