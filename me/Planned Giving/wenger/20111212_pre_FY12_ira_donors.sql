/*** Bryan,

Basically, we need a list of anyone who has made an IRA rollover gift prior to FY 2012 but has not made an IRA gift in FY 2012.  (However, it would also be helpful if it showed other gifts made in FY 2012.)  It would need to be sorted by PM and show preferred phone number and email address.    

This list will be so we can check in with these folks and see if they need assistance with that type of gift before 12/31. 

Sorry for the short notice; would it be possible to get it in the next couple of days?

Chris
***/
select e.id_number, e.pref_mail_name, e.pref_name_sort, e.pref_class_year,  nvl(pm.ass_pref_mail_name, 'Unassigned'), nvl(pm.ass_pref_name_sort, 'Unassigned')
from entity e, a_dw_assignment_pm pm
where pm.id_number(+) = e.id_number
  and e.id_number IN
    (select distinct id_number
       from a_dw_pg
      where gift_type = 'Retirement Plan'
        and date_of_record < '20110701')
  and e.id_number NOT IN
    (select id_number
       from a_dw_pg
      where gift_type = 'Retirement Plan'
        and date_of_record >= '20110701')
   --need to include gift side of things here next to un-include 2012 gifts     
  and e.id_number NOT IN
                         (select id_number
                       from a_dw_pyramid
                      where date_of_record >= '20110701'
                        and receipt in
                        (select prim_gift_receipt_number
                           from primary_gift
                          where lower(prim_gift_comment) like '%ira%'))  
UNION
/*** IRA gifts coded on the gift side of things ***/
select distinct py.id_number, py.pref_mail_name, py.pref_name_sort, py.pref_class_year, nvl(pm.ass_pref_mail_name, 'Unassigned'), nvl(pm.ass_pref_name_sort, 'Unassigned')
  from a_dw_pyramid py, a_dw_assignment_pm pm
 where pm.id_number(+) = py.id_number
   and py.date_of_record < '20110701'
   and py.receipt IN
    (select prim_gift_receipt_number
        from primary_gift
        where lower(prim_gift_comment) like '%ira%')
   and py.id_number NOT IN
                     (select id_number
                       from a_dw_pyramid
                      where date_of_record >= '20110701'
                        and receipt in
                        (select prim_gift_receipt_number
                           from primary_gift
                          where lower(prim_gift_comment) like '%ira%')) 
   and py.id_number NOT IN
        (select id_number
           from a_dw_pg
          where gift_type = 'Retirement Plan'
            and date_of_record >= '20110701')           