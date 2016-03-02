
CREATE OR REPLACE PROCEDURE                   ADVANCE.ACTIVITY_EMAIL3
 as    

    cursor test_cur is 
    SELECT activity_code,
           full_desc,
           activity_date,
           activity_email
      FROM activities_yesterday
  WHERE email_number = '3';
    
    activity_code varchar2(10);
    full_desc varchar2(255);
    activity_date  varchar2(8);
    activity_email  varchar2(40);
    
    crlf         CONSTANT VARCHAR2(2):= CHR(13) || CHR(10);
   message varchar2(30000) := 
   'Activity Deactivation Warning!'||crlf||crlf;
   message3 varchar2(30000) := message;
    
begin
    Dbms_Output.ENABLE(1000000);
    open test_cur;
    
    loop
        fetch test_cur into activity_code, full_desc, activity_date, activity_email;
        exit when test_cur%notfound;
        
        --dbms_output.put_line(id_number || ', ' || pref_mail_name);
        message := message||crlf||
                   activity_code||'   '||full_desc||
                   crlf||
                   'Assignee :  '||activity_email||
                    crlf||
                   'You have until 5pm tonight to update this activity!! It will be automatically updated and deactivated at 3am tomorrow!'||
                    crlf||
                   'blah blah blah blah blah more words you will type later when this actually works. ';
    end loop;
    
    close test_cur;
    
declare
            message2 varchar2(30000) := message;
begin

            dbms_output.enable(30000);
            if (message2 <> message3) then
               --         dbms_output.put_line('length '||substr(message,1,100));
               oia_sendmail_cc('Activity Update Warning - FINAL REMINDER!',message,'genius_dba@minesfoundation.net',activity_email,'fleetmack@gmail.com');
            else
   dbms_output.put_line('no length ');
            end if;

end;
    
end;