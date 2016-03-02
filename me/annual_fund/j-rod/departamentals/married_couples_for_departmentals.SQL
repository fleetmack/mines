/*** Creates Powerbuilder Report for couples and their degrees ***/
/*** IN powerbuilder, sort by pref_jnt_mail_name1 and a secondary sort of e.id_number ***/
/*** In powerbuilder, group by pref_jnt_mail_name1 ***/
select distinct  d.id_number, pref_jnt_mail_name1, d.degree_desc, e.pref_mail_name, d.degree_year
from entity         e,
     a_dw_degrees   d,
     a_temp_dept_mail   j
where d.id_number   = e.id_number
  and j.id_number   = d.id_number
  and flag_married = 1


