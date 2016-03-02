CREATE OR REPLACE TRIGGER failed_logon_notifications
  AFTER SERVERERROR ON DATABASE

DECLARE
  b VARCHAR2(3) := UTL_TCP.CRLF;
  l_subject VARCHAR2(52) := 'Your Advance account has been locked for 15 minutes!';
  l_message VARCHAR2(1000);
  l_email VARCHAR2(100);
BEGIN
   IF ora_is_servererror( 28000 ) THEN
    select DECODE(dw.b_email_address,' ','bmack@mines.edu',dw.b_email_address)
          INTO l_email
                            from advance.a_dw_address_good dw
                            where dw.id_number IN
                                (select zz.id_number
                                    from dba_users  db,  
                                            advance.zz_user  zz
                                    where lower(substr(db.username,5,length(db.username)-4)) = zz.user_name
                                    and    substr(db.username,1,3) = 'ADV'
                                    and    zz.id_number <> '0000033733'
                                    and    substr(db.username,4,1) <> 'A'
                                    and     db.username =
                                        (select name from sys.user$ where ltime = (select max(nvl(ltime,sysdate-20)) from sys.user$)));
    l_message := '*********** THIS IS AN FYI EMAIL - PLEASE DO NOT REPLY TO THIS MESSAGE **********' || b || b;
    l_message := 
        l_message || 'You have given an incorrect password to Advance too many times.  Your account has been locked out for security purposes.' || b ||  b;
    l_message :=
      l_message ||'If this logon attempt was not made by you, please contact Bryan Mack at bmack@mines.edu immediately!' || b || b;
    l_message :=
      l_message ||'If you attempt to log onto Advance before ' || to_char(sysdate + (16/1440),'HH12:MI  AM') || ' today, an addional 15 minute lockout may be enforced.' || b || b;
    l_message :=
      l_message ||'Common password mistakes include having caps lock turned on, or number lock turned off.' || b || b;
    l_message := 
        l_message || 'Email Sent to ' || l_email || b;
l_message :=
      l_message || 'Date/Time:  ' || TO_CHAR( SYSDATE, 'mm/dd/yyyy hh24:mi:ssss' ) || b;
    l_message :=
      l_message || 'OS User:  ' || SYS_CONTEXT( 'USERENV', 'OS_USER' ) || b;
    l_message :=
      l_message || 'Host:  ' || SYS_CONTEXT( 'USERENV', 'HOST' ) || b;

    l_message :=
      l_message || 'Terminal:  ' || SYS_CONTEXT( 'USERENV', 'TERMINAL' ) || b;

    l_message :=
      l_message || 'IP Address:  ' || SYS_CONTEXT( 'USERENV', 'IP_ADDRESS' ) || b;

    l_message :=
      l_message || 'Database Name:      ' || ora_database_name || b;
    BEGIN
      advance.oia_sendmail_cc
        ( subject => l_subject,
          message_body => l_message,
            sender => 'genius_dba@minesfoundation.com',
          reciever => 'bmack@mines.edu',
             cc => l_email
);

    EXCEPTION
      WHEN others THEN
        RAISE;

    END;
  END IF;
END failed_logon_notifications;