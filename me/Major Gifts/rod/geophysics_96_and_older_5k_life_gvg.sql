/*** Geophysics Majors $5000 and more lifetime giving ***/
select p.id_number, a.p_cityline, a.pref_mail_name, a.pref_name_sort, sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) as lifetime_giving
from a_dw_address_good      a,
     a_dw_pyramid           p
where a.id_number           = p.id_number
  and p.flag_alumni        <> '1'
  and a.p_cityline > ' '
  and a.id_number in
    (select id_number
       from a_dw_degrees
      where institution_code = '1'
        and dept_code = 'GEOP'
        and degree_year <= '1996')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 5000
group by p.id_number, a.p_cityline, a.pref_mail_name, a.pref_name_sort
order by a.pref_name_sort