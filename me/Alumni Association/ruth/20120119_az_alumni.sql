/***
Our alums in AZ are hosting their (almost) annual pig roast in honor of E-Days this year and have provided us with a flyer that they'd like us to send to all AZ alumni.  I'll need name, address, city, state, zip - for the whole state of AZ.
***/
select id_number
  from a_dw_address_good
 where record_type_code = 'AL'
   and p_state_code = 'AZ'
   and id_number NOT IN
    (SELECT id_number
       FROM mailing_list
      WHERE mail_list_code IN ('DNM','DNI'))