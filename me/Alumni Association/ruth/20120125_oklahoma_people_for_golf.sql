SELECT id_number
  FROM a_dw_address_good
 WHERE record_type_code = 'AL'
 AND    (p_zipcode BETWEEN '66700-0000' AND '66899-9999'
        OR p_zipcode BETWEEN '67400-0000' AND '67599-9999'
        OR p_zipcode BETWEEN '71900-0000' AND '71999-9999'
        OR p_zipcode BETWEEN '72600-0000' AND '72799-9999'
        OR p_zipcode BETWEEN '73000-0000' AND '73999-9999'
        OR p_zipcode BETWEEN '74000-0000' AND '74099-9999'
        OR p_zipcode BETWEEN '74500-0000' AND '74599-9999'
        OR p_zipcode BETWEEN '74800-0000' AND '74899-9999'
        OR p_zipcode BETWEEN '76300-0000' AND '76399-9999'
        OR p_zipcode BETWEEN '79000-0000' AND '79099-9999')
AND    id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI')