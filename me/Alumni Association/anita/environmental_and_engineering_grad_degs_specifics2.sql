/*** this creates an excel sheet for all alumni with a degrees...search by the degree code field, that's all you have to change
/*** run the first temp-table part first, then run the second to create the excel sheet
/*** copy and paste the excel sheet, this is how Anita likes the data presented
/*** Don't forget to drop the temp table when you're done ***/
/*** 3-9-2005 ***  Bryan Mack ***/


create table temp_anita
as
(select id_number,
        max(decode(xsequence,1,degree_desc,null))      as degree1_desc,
        max(decode(xsequence,2,degree_desc,null))      as degree2_desc,
        max(decode(xsequence,3,degree_desc,null))      as degree3_desc
       from a_dw_degrees
where degree_code IN ('72') 
   and institution_code = '1'
group by id_number);
 
 /***
 drop table temp_anita;
 commit;
 ***/
 
delete from temp_anita
where id_number not in
    (select id_number
       from entity
      where record_status_code = 'A');
commit;

/*** geology
where degree_code IN ('12','52','3','34','22','40','85','81','74')
/*** environmental
where degree_code IN ('71','88','1001','83','1000') 
/*** engineering
where degree_code IN ('407','84','408')***/

select d.id_number,
       n.pref_name_sort,
       n.pref_mail_name,
       d.degree1_desc,
       d.degree2_desc,
       d.degree3_desc,
       a.h_street1,
       a.h_street2,
       a.h_street3,
       a.h_city,
       a.h_state_code,
       a.h_zipcode,
       a.h_foreign_cityzip,
       a.h_country_desc,
       a.h_phone_formatted,
       a.h_email_address,
       a.b_company_name_1,
       a.b_company_name_2,
       a.b_business_title,
       a.h_street1,
       a.b_street2,
       a.b_street3,
       a.b_city,
       a.b_state_code,
       a.b_zipcode,
       a.b_foreign_cityzip,
       a.b_country_desc,
       a.b_phone_formatted,
       a.b_email_address
from   temp_anita  d,
     a_dw_address_good  a,
     entity   n
where n.id_number   = d.id_number
and a.id_number  (+)= d.id_number;