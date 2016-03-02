select id_number,
       h_street1,
       h_street2,
       h_street3,
       h_city,
       h_state,
       h_zipcode,
       h_phone,
       h_email_address,
       b_business_title,
       b_companY_name_1,
       b_street1,
       b_street2,
       b_street3,
       b_city,
       b_state,
       b_zipcode,
       b_phone,
       b_email_address
from a_pin_main
where id_number in
    (select id_number
       from a_dw_demop_prof
      where record_status_code = 'A'
        and echelon > ' ');