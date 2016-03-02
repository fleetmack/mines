/*** IRA Postcard September 2007 Mailing  (FY08) ***/
select *
from a_dw_address_good
where record_type_code = 'AL' 
and pref_class_year between '1948' and '1957'
and p_flag_foreign <> '1'
and flag_omit_from_mail <> '1'
and flag_dns <> '1'