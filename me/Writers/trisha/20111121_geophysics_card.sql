/***
Hi Bryan – could I please request a list of alumni of geophysics, donors to geophysics over the last 10 years (individuals and corps), and anyone who has served as volunteer for that department over the last 10 years? It would be great to include  names, class years, professional titles/business names, capacity and affinity ratings, total giving to dept over last 10 years, total giving to Mines in general in last 10 years, and PMs for any who are assigned.

I’ll be sorting by capacity/affinity/giving histories to look for select alumni and donors to which to send a note from President Scoggins.
***/
select ad.id_number,
       ad.record_type_code,
       ad.pref_mail_name,
       ad.pref_name_sort,
       ad.person_or_org,
       ad.pref_class_year,
       ad.b_company_name_1,
       ad.b_company_name_2,
       ad.b_business_title,
       (select aff.donor_continuum from a_dw_affinity aff where aff.id_number = ad.id_number) affinity,
       NVL((select short_desc from demographic_profile  dp INNER JOIN tms_dp_rating tms USING (dp_rating_code) where dp.dp_rating_type_code = 'RMG'       and dp.id_number = ad.id_number),'N/A') mg_capacity,
       NVL(ass.ass_pref_mail_name,'Unassigned') ass_pref_mail_name,
       NVL(ass.ass_pref_name_sort,'Unassigned') ass_pref_name_sort,
       NVL((select sum(associated_amount+associated_amount_claim+associated_amount_match+associated_amount_joint)
               from a_dw_pyramid py
               where py.id_number = ad.id_number
               and py.year_of_giving >= '2002'
               and py.flag_alumni <> '1'
               and py.flag_non_monthend <> '1'),0) total_giving_last_10,
       NVL((select sum(py2.associated_amount+py2.associated_amount_claim+py2.associated_amount_match+py2.associated_amount_joint)
          from a_dw_pyramid py2
         where py2.id_number = ad.id_number
           and py2.year_of_giving >= '2002'
           and py2.alloc IN
            (select allocation_code
               from allocation
              where (alloc_dept_code IN ('GGPE','GP') 
                     OR
                     program_code IN ('XX2','GGP','GEP')))),0) total_giving_last_10_to_geop
  from a_dw_address_good ad
  LEFT OUTER JOIN a_dw_assignment_pm ass ON ass.id_number = ad.id_number
 where ad.id_number IN
(
--add alumni of geophysics
select distinct id_number
  from a_dw_address_good dw
  inner join a_dw_degrees deg USING (id_number)
  where deg.dept_code = 'GEOP'
  and dw.record_type_code = 'AL'
  and deg.institution_code = '1'
  and deg.degree_code <> '401'
UNION
--add donors to geophysics the past 10 years
select distinct id_number
  from a_dw_address_good  
  inner join a_dw_pyramid py USING (id_number)
where py.year_of_giving >= '2002'
  and py.alloc IN 
            (select allocation_code
               from allocation
              where (alloc_dept_code IN ('GGPE','GP') 
                     OR
                     program_code IN ('XX2','GGP','GEP')))
UNION
-- add those on VGP committee at any time in the last 10 years
select distinct id_number
  from a_dw_address_good
  inner join committee USING (id_number)
 where committee_code = 'VGP'
   and (start_dt >= '20010701' OR stop_dt >= '20010701')
   )