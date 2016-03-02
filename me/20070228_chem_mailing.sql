select a.id_number,
       a.pref_mail_name,
       a.pref_name_sort,
       a.pref_class_year,
       max(decode(xsequence,1,d.degree_desc,null))      as degree1_desc,
       max(decode(xsequence,1,d.major_code1_desc,null)) as major_code_1,
       max(decode(xsequence,1,d.degree_year,null))      as degree_1_year,
       max(decode(xsequence,2,d.degree_desc,null))      as degree2_desc,
       max(decode(xsequence,2,d.major_code1_desc,null)) as major_code_2,
       max(decode(xsequence,2,d.degree_year,null))      as degree_2_year,
       max(decode(xsequence,3,d.degree_desc,null))      as degree3_desc,
       max(decode(xsequence,3,d.major_code1_desc,null)) as major_code_3,
       max(decode(xsequence,3,d.degree_year,null))      as degree_3_year
from a_dw_address_good      a,
     a_dw_degrees           d
where a.id_number           = d.id_number
  and d.dept_code = 'CHEM'
group by a.id_number,
         a.pref_mail_name,
         a.pref_name_sort,
         a.pref_class_year;