/***those who PAID (not honorary, etc.) between 10/01/2002 and 10/31/2003 and who were members in 2003 and 2004***/
/***if doing a mail-merge, make sure to INCLUDE spouses by commenting-out the spouse part of a_std_1***/
select id_number
from a_dw_memb
where memb_year = '2003'
and memb_type_code NOT IN ('C','L','H')
and id_number in
    (select id_number
       from a_dw_memb
      where memb_year = '2004')
and memb_number in
    (select memb_number
       from memb
      where to_char(processed_date,'YYYYMMDD') between '20021001' and '20031031')
