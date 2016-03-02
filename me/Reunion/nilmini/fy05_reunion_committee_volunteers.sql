/*** FY05 Reunion Committee Volunteers ***/
select id_number
from committee
where committee_code = 'RGP'
and committee_status_code = 'A'
and id_number in
    (select id_number
       from a_dw_address_good
      where pref_class_year IN ('1940','1945','1950','1955','1960','1965','1970','1975','1980','1985','1990','1995','2000'))