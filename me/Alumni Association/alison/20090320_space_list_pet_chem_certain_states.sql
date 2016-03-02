/***
Petroleum Eng., Chemical Eng., Petroleum Refining, Engineering – Mechanical Specialty
1999 to present, US Only, including ONLY the following states: WA, OR, ID, MT, ND, SD, WY, CO, NE, KS, OK, TX, NM, AZ, UT, NV, CA, LA, PA, DE, OH, AND IL.
*/
SELECT dw.id_number
   FROM a_dw_address_good      dw
WHERE dw.record_type_code = 'AL'
     AND dw.pref_class_year >= '1999'
     AND dw.p_state_code IN ('WA','OR','ID','MT','ND','SD','WY','CO','NE','KS','OK','TX','NM','AZ','UT','NV','CA','LA','PA','DE','OH','IL')
     AND dw.id_number IN
        (select distinct(id_number)
        from a_dw_degrees
        where institution_code = '1'
        and (dept_desc IN ('Petroleum Engineering Department','Department of Chemical Engineering') 
        or dept_desc = 'Engineering Division' and major_code1_desc = 'Mechanical engineering'));
 /***
select distinct(degree_desc), major_code1_desc
from a_dw_degrees
where dept_desc IN ('Engineering Division')


select * from a_dw_degrees


select distinct(dept_desc)
from a_dw_degrees
where institution_code = '1'


select distinct(id_number)
from a_dw_degrees
where institution_code = '1'
and (dept_desc IN ('Petroleum Engineering Department','Department of Chemical Engineering') 
       or dept_desc = 'Engineering Division' and major_code1_desc = 'Mechanical engineering')
***/