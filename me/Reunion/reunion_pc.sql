/*** Reunion Year and PC in FY05 or FY06 ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year IN ('1946','1951','1956','1961','1966','1971','1976','1981','1986','1991','1996','2001')
and id_Number in
    (select id_number
       from a_dw_gift_clubs
      where (pc05 = '1'
             or pc06 = '1'))