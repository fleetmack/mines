select  p.pref_mail_name, n.pref_name, p.associated_amount, p.associated_amount_match, p.associated_amount_claim
 from a_dw_pyramid  p,
      name          n
where p.id_on_behalf_of = n.ID_NUMBER
and n.name_type_code = '00' 
and year_of_giving = '2002'
and flag_behalf = '1'
and record_type_code in ('FD')




--,'FD')