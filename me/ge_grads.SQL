/*** Creates Temp Table with those with GE degrees ***/
create table a_temp_ge_grads
as
(select distinct a.id_number from a_dw_address_good     a,
              a_dw_degrees          d
        where a.id_number = d.id_number
          and d.degree_code IN ('12','22','3','34','40','52','74','85')
          and d.institution_code = '1');
commit;
/

/*** Selects Addresses Only of those people ***/
select id_number,
       pref_mail_name,
       p_street1,
       p_street2,
       p_street3,
       p_cityline
from a_dw_address_good
where id_number in
    (select id_number from a_temp_ge_grads);


/*** Drops Table ***/
drop table a_temp_ge_grads;
commit;
/
