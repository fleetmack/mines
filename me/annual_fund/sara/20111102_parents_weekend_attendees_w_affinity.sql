/*** Affinity and such for people ***/
select dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year, ass.ass_pref_mail_name, ass.ass_pref_name_sort,
(select aff.donor_continuum from a_dw_affinity aff where aff.id_number = dw.id_number),
(select dp.rp_mgc_desc from a_dw_demop_prof dp  where dp.id_number = act.id_number)
from a_dw_assignment_pm   ass,
     entity   dw,
     activity act
where ass.id_number(+) = dw.id_number
  and act.id_number = dw.id_number
  and act.activity_code = 'C374' 
  and act.activity_participation_code = 'IA';