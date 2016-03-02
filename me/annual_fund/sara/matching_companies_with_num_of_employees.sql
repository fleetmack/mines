/*** Matching Companies w/ # of employees ***/
select  distinct(d.employer_id_number), 
        d.employer_name1, 
        d.employer_name2,
        a.street1,
        a.street2,
        a.street3,
        a.city,
        a.state_code,
        a.zipcode,
        '('||a.phone_area_code||') '||substr(a.phone_number,1,3)||'-'||substr(a.phone_number,4,4) as phone_formatted,      
        m.hep_ratio||':1',
        count(d.id_number) as employees
from    entity     e,
        a_dw_jobs d,
        matching_policy m,
        address         a
where   e.id_number     = d.employer_id_number
  and   e.id_number     = a.id_number
  and   a.addr_pref_ind     = 'Y'
  and   e.record_status_code = 'A'
  and   d.job_status_code      = 'C'
  and   d.employer_id_number = m.id_number
group by d.employer_id_number, d.employer_name1, d.employer_name2, a.street1, a.street2, a.street3, a.city, a.state_code, a.zipcode,'('||a.phone_area_code||') '||substr(a.phone_number,1,3)||'-'||substr(a.phone_number,4,4), m.hep_ratio||':1'
order by employees desc;



SELECT DISTINCT(d.employer_id_number),
       d.employer_name1,
       d.employer_name2,
       a.street1,
       a.street2,
       a.street3,
       a.city,
       a.state_code,
       a.zipcode,
       '('||a.phone_area_code||') '||substr(a.phone_number,1,3)||'-'||substr(a.phone_number,4,4) as phone_formatted,
       count(d.id_number) as "Number of Employees"
  FROM entity       e,
       a_dw_jobs    d,
       address      a
 WHERE e.id_number  =   d.employer_id_number
   AND e.id_number  =   a.id_number
   AND a.addr_pref_ind = 'Y'
   AND e.id_number NOT IN
        (SELECT id_number
           FROM matching_policy)
GROUP BY d.employer_id_number, d.employer_name1, d.employer_name2, a.street1, a.street2, a.street3, a.city, a.state_code, a.zipcode,'('||a.phone_area_code||') '||substr(a.phone_number,1,3)||'-'||substr(a.phone_number,4,4)
order by "Number of Employees" DESC;

