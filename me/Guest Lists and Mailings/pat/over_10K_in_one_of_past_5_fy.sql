drop table temp_pat_blah;
commit;
/

create table temp_pat_blah
as
(select a.id_number as id_number
--a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year, 
  --     sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) as giving
from a_dw_address_good  a,
     a_dw_pyramid       p
where p.id_number       = a.id_number
  and a.person_or_org   = 'P'
  and p.year_of_giving  = '2006'
  and a.p_zipcode between '77000-0000' and '77999-9999'
having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >= 10000
group by a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year);
commit;
/


insert into temp_pat_blah
(select a.id_number as id_number
--a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year, 
  --     sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) as giving
from a_dw_address_good  a,
     a_dw_pyramid       p
where p.id_number       = a.id_number
  and a.person_or_org   = 'P'
  and p.year_of_giving  = '2005'
  and a.p_zipcode between '77000-0000' and '77999-9999'
  and a.id_number  NOT IN
    (SELECT id_number FROM temp_pat_blah)
having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >= 10000
group by a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year);
commit;
/


insert into temp_pat_blah
(select a.id_number as id_number
--a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year, 
  --     sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) as giving
from a_dw_address_good  a,
     a_dw_pyramid       p
where p.id_number       = a.id_number
  and a.person_or_org   = 'P'
  and p.year_of_giving  = '2004'
  and a.p_zipcode between '77000-0000' and '77999-9999'
  and a.id_number  NOT IN
    (SELECT id_number FROM temp_pat_blah)
having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >= 10000
group by a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year);
commit;
/


insert into temp_pat_blah
(select a.id_number as id_number
--a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year, 
  --     sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) as giving
from a_dw_address_good  a,
     a_dw_pyramid       p
where p.id_number       = a.id_number
  and a.person_or_org   = 'P'
   and p.year_of_giving  = '2003'
  and a.p_zipcode between '77000-0000' and '77999-9999'
  and a.id_number  NOT IN
    (SELECT id_number FROM temp_pat_blah)
having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >= 10000
group by a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year);
commit;
/


insert into temp_pat_blah
(select a.id_number as id_number
--a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year, 
  --     sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) as giving
from a_dw_address_good  a,
     a_dw_pyramid       p
where p.id_number       = a.id_number
  and a.person_or_org   = 'P'
  and p.year_of_giving  = '2002'
  and a.p_zipcode between '77000-0000' and '77999-9999'
  and a.id_number  NOT IN
    (SELECT id_number FROM temp_pat_blah)
having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >= 10000
group by a.id_number, a.pref_mail_name, a.pref_name_sort, a.record_type_code, a.pref_class_year);
commit;
/