/*** IRA gifts coded on the gift side of things, FY12 ***/
select id_number, 
       py.date_of_record, 
       py.pref_mail_name, 
       py.pref_name_sort, 
       py.pref_class_year, 
       pm.prim_gift_comment,
       py.alloc,
       py.associated_amount gift, 
       py.associated_amount_match+py.associated_amount_claim match, 
       py.associated_amount_joint joint_credit,  
       py.associateD_amount+py.associated_amount_match+py.associated_amount_claim+py.associateD_amount_joint "soft credit", 
       py.total_commitment
  from a_dw_pyramid py,
       primary_gift pm
 where pm.prim_gift_receipt_number = py.receipt
   and py.year_of_giving = '2012'
   and lower(pm.prim_gift_comment) like '%ira%'
order by py.pref_name_sort;