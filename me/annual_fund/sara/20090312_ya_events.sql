/***Golden Event 
All Young Alum Colorado Donors – made a gift in FY08 or FY09 
                                                              i.      Name
                                                            ii.      Address
                                                          iii.      Email
                                                          iv.      Phone
                                                            v.      Gift Amount
                                                          vi.      Gift Designation***/
select distinct(ad.id_number),
          ad.pref_mail_name,
          ad.pref_class_year,
          ad.salutation,
          ad.p_email_address,
          ad.p_cityline,
          ad.p_phone_formatted,
          decode(ad.flag_omit_from_mail,0,'No','Yes') "Omit From Mail?",
          decode(ad.flag_dns,0,'No','Yes') "DNS?",
          decode(ad.flag_dnp,0,'No','Yes') "Do Not Phone?",
          '$'||max(p.associated_amount+associated_amount_match+associated_amount_claim) "max_gift",
          (select al.short_name from allocation al where p.alloc = al.allocation_code)
from a_dw_pyramid       p,
        a_dw_address_good    ad
where p.id_number = ad.id_number 
and p.record_type_code = 'AL'
and ad.p_state_code = 'CO'
and (p.year_of_giving = '2008' or p.year_of_giving = '2009')
and p.pref_class_year >= '2000'
and p.flag_alumni <> '1'
group by ad.id_number, ad.pref_mail_name, ad.pref_mail_name, ad.pref_class_year, ad.salutation, ad.p_email_address, ad.p_cityline, ad.p_phone_formatted, p.alloc, ad.flag_omit_from_mail, ad.flag_dns, ad.flag_dnp;
/***
Anchorage Event 
All Young Alumni in Alaska (regardless of gift) 
                                                              i.      Name 
                                                            ii.      Address
                                                          iii.      Email
                                                          iv.      Phone
                                                            v.      Gift Amount if applicable
                                                    vi.      Gift Designation if applicable
***/
select distinct(ad.id_number),
          ad.pref_mail_name,
          ad.pref_name_sort,
          ad.pref_class_year,
          ad.salutation,
          ad.p_email_address,
          ad.p_cityline,
          ad.p_phone_formatted,
          decode(ad.flag_omit_from_mail,0,'No','Yes') "Omit From Mail?",
          decode(ad.flag_dns,0,'No','Yes') "DNS?",
          decode(ad.flag_dnp,0,'No','Yes') "Do Not Phone?",
          '$'||max(p.associated_amount+associated_amount_match+associated_amount_claim) "max_gift",
          (select al.short_name from allocation al where p.alloc = al.allocation_code) "allocation"
from a_dw_pyramid       p,
        a_dw_address_good    ad
where p.id_number(+) = ad.id_number
and ad.record_type_code = 'AL'
and ad.p_state_code = 'AK'
and ad.pref_class_year >= '2000'
group by ad.id_number, ad.pref_mail_name, ad.pref_name_sort, ad.pref_mail_name, ad.pref_class_year, ad.salutation, ad.p_email_address, ad.p_cityline, ad.p_phone_formatted, p.alloc, ad.flag_omit_from_mail, ad.flag_dns, ad.flag_dnp
order by ad.pref_name_sort;