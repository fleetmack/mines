/*** Denver PC FY11 ***/
select dw.id_number, dw.record_type_code, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year, gc.total_years_pc, gc.consecutive_pc
from a_dw_address_good  dw,
     a_dw_gift_clubs    gc
where dw.id_number = gc.id_number
and   gc.pc11 = '1'
and dw.p_zipcode BETWEEN '80000-0000' and '80505-9999';

/*** Denver PC some year, but not FY11 ***/
select dw.id_number, dw.record_type_code, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year, gc.total_years_pc, gc.consecutive_pc
from a_dw_address_good  dw,
     a_dw_gift_clubs    gc
where dw.id_number = gc.id_number
and   gc.pc11 <> '1'
and   gc.total_years_pc >= '1'
and dw.p_zipcode BETWEEN '80000-0000' and '80505-9999';


/*** How much they gave ***/
/*** Denver PC FY11 ***/
select sum(associated_amount+associated_amount_match+associated_amount_claim)
from a_dw_address_good  dw,
     a_dw_gift_clubs    gc,
     a_dw_pyramid       py
where dw.id_number = gc.id_number
and   gc.id_number = py.id_number
and   py.year_of_giving = '2011'
and   py.flag_alumni <> '1'
and   py.flag_non_monthend <> '1'
and   gc.pc11 = '1'
and dw.p_zipcode BETWEEN '80000-0000' and '80505-9999';