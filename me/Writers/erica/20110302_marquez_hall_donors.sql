/*** Marquez Hall Donors with their gift credit ***/
/*** Note this double-counts as couples have credit for each others' gifts ***/
select id_number, pref_mail_name, person_or_org, sum(total_jnt_commitment)
from a_dw_pyramid
where alloc IN ('5378','5478','B4556','9262')
group by id_number, pref_mail_name, person_or_org