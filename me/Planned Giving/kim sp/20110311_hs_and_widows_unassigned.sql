/*** HS Members ***/
select gc.id_number, gc.pref_mail_name, gc.pref_name_sort, DECODE(pm.ass_pref_name_sort,NULL,'Unassigned',pm.ass_pref_mail_name),
        nvl((select t.total from a_dw_lt_giving t where t.id_number = gc.id_number),0) lifetime_giving,
        nvl((select tms.short_desc from tms_dp_rating tms where tms.dp_rating_code = (select d.dp_rating_code from demographic_profile d where dp_rating_type_code = 'KMG' and d.id_number = gc.id_number)),'n/a') kintera_mgc,
        nvl((select tms.short_desc from tms_dp_rating tms where tms.dp_rating_code = (select d.dp_rating_code from demographic_profile d where dp_rating_type_code = 'MGC' and d.id_number = gc.id_number)),'n/a') old_gga_mgc,
        nvl((select max(pg.gift_type) from a_dw_pg pg where pg.id_number = gc.id_number),'n/a') planned_gift_type
from a_dw_gift_clubs   gc,
        a_dw_assignment_pm  pm
where pm.id_number(+) = gc.id_number
and gc.heritage_society = '1'
and gc.record_status_code = 'A';

/*** Widows ***/
select e.id_number, e.pref_mail_name, e.pref_name_sort, DECODE(pm.ass_pref_name_sort,NULL,'Unassigned',pm.ass_pref_mail_name),
         nvl((select decode(gc.heritage_society,'1','X',' ') from a_dw_gift_clubs gc where gc.id_number = e.id_number),' ') heritage_society_ind,
         nvl((select t.total from a_dw_lt_giving t where t.id_number = e.id_number),0) lifetime_giving,
        nvl((select tms.short_desc from tms_dp_rating tms where tms.dp_rating_code = (select d.dp_rating_code from demographic_profile d where dp_rating_type_code = 'KMG' and d.id_number = e.id_number)),'n/a') kintera_mgc,
        nvl((select e2.pref_mail_name from entity e2 where e2.id_number = (select max(fs2.spouse_id_number) from former_spouse fs2 where fs2.id_number = e.id_number)),'n/a')  spouse_name
from entity e,
        a_dw_assignment_pm  pm
where pm.id_number(+) = e.id_number
and e.record_status_code = 'A'
and e.id_number in
    (select ert.id_number
        from entity_record_type ert
      where ert.record_type_code = 'WI');