/*** Pledge Reminders -- Annual Gifts with no payments made as of yet ***/
select p.id_number, 
       p.pref_mail_name, 
       p.pref_name_sort, 
       p.receipt, 
       p.pledge_face_amount, 
       p.prim_pledge_amount_os, 
       p.date_of_record, 
       p.transaction_type, 
       NVL(a.ass_pref_mail_name,' ') as ass_pref_mail_name,
       l.long_name,
       p.appeal_code,
       NVL(t.full_desc,'UNKNOWN') as appeal_type
from a_dw_pyramid p,
     a_dw_fiscal_dates f,
     a_dw_assignment_pm a,
     allocation l,
     tms_appeal_type t,
     appeal_header ap
where p.id_number = a.id_number (+)
and p.appeal_code = ap.appeal_code (+)
and ap.appeal_type = t.appeal_type_code (+)
and p.alloc = l.allocation_code
and p.flag_alumni = 0
and p.transaction_type = 'P'
and p.prim_pledge_amount_os > 0
and p.person_or_org = 'P'
and p.pledge_face_amount < 25000
and p.pledge_face_amount = p.prim_pledge_amount_os
order by date_of_record;

/*** Pledge Reminders -- Annual Gifts with some payments made ***/
select p.id_number, 
       p.pref_mail_name, 
       p.pref_name_sort, 
       p.receipt, 
       p.pledge_face_amount, 
       p.prim_pledge_amount_os, 
       p.date_of_record, 
       p.transaction_type, 
       NVL(a.ass_pref_mail_name,' ') as ass_pref_mail_name,
       l.long_name,
       p.appeal_code,
       NVL(t.full_desc,'UNKNOWN') as appeal_type
from a_dw_pyramid p,
     a_dw_fiscal_dates f,
     a_dw_assignment_pm a,
     allocation l,
     tms_appeal_type t,
     appeal_header ap
where p.id_number = a.id_number (+)
and p.appeal_code = ap.appeal_code (+)
and ap.appeal_type = t.appeal_type_code (+)
and p.alloc = l.allocation_code
and p.flag_alumni = 0
and p.transaction_type = 'P'
and p.prim_pledge_amount_os > 0
and p.person_or_org = 'P'
and p.pledge_face_amount < 25000
and p.pledge_face_amount <> p.prim_pledge_amount_os
order by date_of_record;

/*** Pledge Reminders -- Major Gifts with no payments made ***/
select p.id_number, 
       p.pref_mail_name, 
       p.pref_name_sort, 
       p.receipt, 
       p.pledge_face_amount, 
       p.prim_pledge_amount_os, 
       p.date_of_record, 
       p.transaction_type, 
       NVL(a.ass_pref_mail_name,' ') as ass_pref_mail_name,
       l.long_name,
       p.appeal_code,
       NVL(t.full_desc,'UNKNOWN') as appeal_type
from a_dw_pyramid p,
     a_dw_fiscal_dates f,
     a_dw_assignment_pm a,
     allocation l,
     tms_appeal_type t,
     appeal_header ap
where p.id_number = a.id_number (+)
and p.appeal_code = ap.appeal_code (+)
and ap.appeal_type = t.appeal_type_code (+)
and p.alloc = l.allocation_code
and p.flag_alumni = 0
and p.transaction_type = 'P'
and p.prim_pledge_amount_os > 0
and p.person_or_org = 'P'
and p.pledge_face_amount >= 25000
and p.pledge_face_amount = p.prim_pledge_amount_os
order by date_of_record;

/*** Pledge Reminders -- Major Gifts with some payments made ***/
select p.id_number, 
       p.pref_mail_name, 
       p.pref_name_sort, 
       p.receipt, 
       p.pledge_face_amount, 
       p.prim_pledge_amount_os, 
       p.date_of_record, 
       p.transaction_type, 
       NVL(a.ass_pref_mail_name,' ') as ass_pref_mail_name,
       l.long_name,
       p.appeal_code,
       NVL(t.full_desc,'UNKNOWN') as appeal_type
from a_dw_pyramid p,
     a_dw_fiscal_dates f,
     a_dw_assignment_pm a,
     allocation l,
     tms_appeal_type t,
     appeal_header ap
where p.id_number = a.id_number (+)
and p.appeal_code = ap.appeal_code (+)
and ap.appeal_type = t.appeal_type_code (+)
and p.alloc = l.allocation_code
and p.flag_alumni = 0
and p.transaction_type = 'P'
and p.prim_pledge_amount_os > 0
and p.person_or_org = 'P'
and p.pledge_face_amount >= 25000
and p.pledge_face_amount <> p.prim_pledge_amount_os
order by date_of_record;