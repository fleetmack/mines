drop table a_temp_temp;
create table a_temp_temp as 
(select e.id_number,
        e.pref_mail_name,
        e.pref_name_sort,
        a.allocation_code,
        1 as xsequence
   from entity e, assignment a
  where a.allocation_code is not null
    and e.id_number = a.assignment_id_number);
commit;
/

DECLARE
    CURSOR curs_get_sequence IS
    SELECT allocation_code, xsequence 
      FROM a_temp_temp
  ORDER BY allocation_code, xsequence

  FOR UPDATE OF xsequence;

   i                 number := 1;
   v_allocation_code       a_temp_temp.allocation_code%type;
   v_xsequence       a_temp_temp.xsequence%type;
   v_prev_allocation_code  a_temp_temp.allocation_code%type;

   BEGIN

   OPEN curs_get_sequence; 
      LOOP 
        FETCH       curs_get_sequence 
         INTO       v_allocation_code, v_xsequence; 
         EXIT WHEN  curs_get_sequence%notfound;
             IF   v_allocation_code = v_prev_allocation_code THEN
                  i := i + 1;
         UPDATE   a_temp_temp
            SET   xsequence = i 
          WHERE   CURRENT OF curs_get_sequence;
           ELSE   v_prev_allocation_code := v_allocation_code; i := 1;
         END IF;
       END LOOP;
    CLOSE curs_get_sequence;
END;
/

COMMIT;
/

SELECT p.id_number, 
       p.pref_mail_name,
       p.pref_name_sort,
       p.receipt,
       NVL (d.full_desc,'Unknown') as full_desc,
       p.associated_amount,
       p.date_of_record,
       a.long_name,
       a.allocation_code,
       max(decode(t.xsequence,1,t.pref_mail_name,' '))||
       max(decode(t.xsequence,2,', '||t.pref_mail_name,' '))||
       max(decode(t.xsequence,3,', '||t.pref_mail_name,' '))||
       max(decode(t.xsequence,4,', '||t.pref_mail_name,' ')) as managers 
  FROM a_dw_pyramid             p,
       a_dw_fiscal_dates        f,
       allocation               a,
       tms_alloc_department     d,
       a_temp_mack2             t
 WHERE p.alloc                  = a.allocation_code
   AND p.date_of_record         BETWEEN f.pfy_beg AND f.pfy_end
   AND a.alloc_dept_code        = d.alloc_department (+)
   AND a.allocation_code        = t.allocation_code
   AND p.person_or_org          = 'O'
   AND p.flag_alumni            = 0
   AND p.transaction_type       NOT IN ('MG','MC','P')
   group by p.id_number, 
       p.pref_mail_name,
       p.pref_name_sort,
       p.receipt,
       NVL (d.full_desc,'Unknown'),
       p.associated_amount,
       p.date_of_record,
       a.long_name,
       a.allocation_code
   
   

