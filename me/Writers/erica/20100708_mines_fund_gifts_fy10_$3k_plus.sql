/*** USE THIS FOR ERICA'S STUFF!! YOUR TOTAL LIFETIME NUMBERS ARE HOSED RIGHT NOW BUT SHOULD BE RIGHT IN A_DW_LT_MF_GIVING ***/
select e.id_number, e.fy10_cash_plus_match, g.pref_mail_name, g.pref_name_sort, g.p_street1,   g.PREF_CLASS_YEAR ,   
          g.SALUTATION ,   
          g.P_CARE_OF ,   
          g.P_COMPANY_NAME_1 ,   
          g.P_COMPANY_NAME_2 ,   
          g.P_BUSINESS_TITLE ,   
          g.P_STREET1 ,   
          g.P_STREET2 ,   
          g.P_STREET3 ,   
          g.P_CITYLINE ,   
          g.P_FOREIGN_CITYZIP ,   
          g.P_COUNTRY_DESC ,   
          g.P_FLAG_FOREIGN ,   
          g.P_ZIPCODE ,   
          g.P_EMAIL_ADDRESS ,   
          g.P_PHONE_FORMATTED ,   
          g.P_CITY ,   
          g.P_STATE_CODE,
         nvl(pm.ass_pref_mail_name,' ')
from 
(select p.id_number, p.pref_mail_name, p.pref_name_sort, p.record_type_code, p.pref_class_year, 
--g.total_w_pledge total_lifetime_commitment_mf, 
sum(p.total_jnt_commitment) fy10_commitment, sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim + p.associated_amount_joint) fy10_cash_plus_match
from a_dw_pyramid   p,
        a_dw_lt_mf_giving  g
where g.id_number = p.id_number
and p.year_of_giving = '2010'
and p.alloc = '3795'
and p.flag_alumni <> '1'
and p.flag_non_monthend <> '1'
and p.person_or_org = 'P'
and p.associated_code <> 'B'
group by p.id_number, p.pref_mail_name, p.pref_name_sort, p.record_type_code, p.pref_class_year, g.total+g.joint+g.match, g.total_w_pledge
having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim + p.associated_amount_joint)  >= 3000) e,
a_dw_address_good   g,
a_dw_assignment_pm  pm
where e.id_number = g.id_number
and pm.id_number(+) = e.id_number;