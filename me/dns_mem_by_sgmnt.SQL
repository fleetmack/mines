/*** A104 DNS List ***/
select a.id_number, a.pref_mail_name, a.pref_name_sort, ass.ass_pref_mail_name, ass.ass_pref_name_sort
from    a_aga_3             a,
        a_dw_assignment     ass
where   ass.id_number       = a.id_number
--and a_comb_seg IN ('frnd_04','mg_04','nvr_frnd_04','nvr_mg_04','nvr_og_04','nvr_yg_04','og_04','yg_04')
and ass_type IN ('PP','PS')
and ass_active_ind = 'Y'
and a_comb_seg = 'reun_04'
--and a.pref_class_year IN ('1944','1949','1954','1959','1964','1969','1974','1979','1984','1989','1994')
order by ass.ass_pref_name_sort

