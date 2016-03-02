/***
I hadn’t done it.  With the former parents, make sure they’ve been a donor in the 
last couple of years, and probably shouldn’t include former students, and anything 
else you can think of now that we’ve got all these extra people on the system.  
I think I may have updated a_std_rcptn at some point with updated logic for all that – maybe.

 A417

May I please request a contact list of everyone in Houston (77000-77899) for a presidential reception?  
This would include all preferred and business contact information (mail, phone, email) for friends, donors, alumni, parents, heritage society members, etc.  
***/
SELECT id_number
FROM a_dw_address_good
WHERE p_zipcode (p_zipcode BETWEEN '77000-0000' AND '77899-9999'
               OR p_zipcode BETWEEN '70500-0000' AND '70669-9999')
AND id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNM','DNI'))
AND (
         (record_type_code IN ('AL','PA','FR'))
OR (id_number IN
      (SELECT id_number FROM a_dw_gift_clubs WHERE heritage_society = '1'))
OR (id_number IN
        (SELECT id_number FROM a_dw_pyramid WHERE record_type_code = 'PX' and year_of_giving >= '2008'))
);