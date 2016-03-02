/*** Activity Summary Report for Reunion 2010 ***/
select nvl(p.ass_pref_mail_name,' ') pm, nvl(p.ass_pref_name_sort,' ') pm_sort, e.id_number, e.pref_mail_name, e.pref_name_sort, 
nvl(DECODE(e.record_type_code,'AL',(select ert.record_type_code||', '||ert.class_year from entity_record_type ert where ert.id_number = e.id_number and ert.record_type_code IN ('GS','ST')),e.record_type_code||', '||e.pref_class_year),e.record_type_code||', '||e.pref_class_year) record_type,
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A435'),0)"Celebration of Alumni",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A451'),0) "Faculty Symposium",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A453'),0) "Geology Museum Lunch",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A455'),0)"Geol Geop Min Dept Reun Rcptn",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'C342'),0) "50th Breakfast Class of 1960",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A447'),0) "50th Dinner Class of 1960",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A450'),0)"Golden Miner Dinner 32-59",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A446'),0) "Class Dinner 65, 70, 75, 80",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A448'),0) "25th Reception Class of 1985",
nvl((select decode(a2.activity_participation_code,'IX',1+a2.guest_nmb,0) from activity a2 where a2.id_number = e.id_number and a2.activity_code = 'A449'),0) "Happy Hour 90, 95, 00, 05"
from entity   e,
        a_dw_assignment_pm  p
where p.id_number(+) = e.id_number
and e.id_number in
    (SELECT a.id_number
        FROM activity a
     WHERE a.activity_code IN ('A435','A451','A453','A455','C342','A447','A450','A446','A448','A449')
          AND a.activity_participation_code = 'IX')
order by pref_name_sort;