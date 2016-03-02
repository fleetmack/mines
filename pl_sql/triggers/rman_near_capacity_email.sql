CREATE OR REPLACE TRIGGER rman_full_email
  AFTER SERVERERROR ON DATABASE

DECLARE
  b VARCHAR2(3) := UTL_TCP.CRLF;
  l_subject VARCHAR2(40) := 'Alert - RMAN FRA Nearing Capacity';
  l_message VARCHAR2(500);


BEGIN
  IF ora_is_servererror( 19815 ) THEN
   l_message := 'Your RMAN is almost at capactiy -- chiggidy check it before it wrecks it' || b || b;
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
      advance.oia_sendmail
        ( subject => l_subject,
          message_body => l_message,
            sender => 'dba@minesfoundation.com',
          reciever => 'bmack@mines.edu' 
);

    EXCEPTION
      WHEN others THEN
        RAISE;

    END;
  END IF;
END failed_logon_notifications;