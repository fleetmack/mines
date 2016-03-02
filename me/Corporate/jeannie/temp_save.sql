SELECT p.id_number, 
       p.pref_mail_name,
       p.pref_name_sort,
       NVL (d.full_desc,'Unknown') as full_desc,
       p.associated_amount,
       p.date_of_record,
       e.pref_mail_name,
	    e.pref_name_sort,
       a.long_name,
       a.allocation_code
  FROM a_dw_pyramid             p,
       a_dw_fiscal_dates        f,
       allocation               a,
       assignment           a2,
       tms_alloc_department     d,
       entity                   e
 WHERE p.alloc                  = a.allocation_code
   AND p.date_of_record         BETWEEN f.pfy_beg AND f.pfy_end
   AND a.alloc_dept_code        = d.alloc_department (+)
   AND a2.assignment_id_number          = e.id_number (+)
   AND a2.allocation_code  = a.allocation_code
   AND a2.assignment_type = 'DP'
   AND p.person_or_org          = 'O'
   AND p.flag_alumni            = 0
   AND p.transaction_type       NOT IN ('MG','MC','P')
