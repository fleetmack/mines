CREATE OR REPLACE PROCEDURE         ADVANCE.OUA_DAILY_EMAIL 

IS
v_id_number varchar2(10);
v_email_address varchar2(60);
cursor cur_email_list IS
SELECT id_number, email_address
  INTO v_id_number, v_email_address
  FROM zz_user
 WHERE active_ind = 'Y'
   AND email_address <> ' '
   AND office_code = 'OIA';

BEGIN
FOR rec_prod IN cur_email_list LOOP
v_id_number := rec_prod.id_number;
v_email_address := rec_prod.email_address;
dbms_output.put_line('found record '||v_id_number||v_email_address);
begin
oia_daily_gift_email(v_id_number, v_email_address);
oia_daily_over_soc_email(v_id_number, v_email_address, 'AKonegni@mines.edu');
end;
END LOOP;
END;