--How many YA do we have both a good physical address and email for? 
select count(*) ya_have_both
from a_dw_address_good
where record_type_code = 'AL'
and flag_dns <> '1'
and flag_omit_from_mail <> '1'
and p_street1 > ' '
and p_flag_foreign <> '1'
and p_email_address > ' '
and pref_class_year BETWEEN '2001' and '2009';

--How many YA do we only have a good physical address for? 
select count(*) ya_have_only_mail
from a_dw_address_good
where record_type_code = 'AL'
and flag_dns <> '1'
and p_flag_foreign <> '1'
and flag_omit_from_mail <> '1'
and p_street1 > ' '
and p_email_address <= ' '
and pref_class_year BETWEEN '2001' and '2009';


--How many YA do we only have a good email for? 
select count(*) ya_have_only_email
from a_dw_address_good
where record_type_code = 'AL'
and flag_dns <> '1'
and p_flag_foreign <> '1'
--and flag_omit_from_mail <> '1'
and p_street1 <= ' '
and p_email_address > ' '
and pref_class_year BETWEEN '2001' and '2009';

--All Foreign Lumped into one e-Group 
select count(*) ya_foreign_have_email
from a_dw_address_good
where p_flag_foreign = '1'
and flag_dns <> '1'
and record_type_code = 'AL'
and p_email_address > ' '
and pref_class_year BETWEEN '2001' and '2009';