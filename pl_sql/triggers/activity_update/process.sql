/***
select *
from activity
where activity_code = 'A0001';

1) Email the event coordinator & Bryan the day after the event takes place -- they have 3 weeks to enter everything -- Bryan saves this email
2) Email the event coordinator & Bryan 2 weeks after the event takes place --they have 1 week left -- give them the hard deadline of when the procedure will be executed -- Bryan saves this email
3) Run procedure which updates everything necessary - IA to IN, I to NR, etc.
4) Email Bryan 3 weeks after the event takes place -- confirmation -- store this email

***/
--a procedure will have to run from a scheduled task.  try using oracle scheduler for this instead of windows scheduled tasks, just to learn something new.... so you may not use triggers at all

CREATE OR REPLACE PROCEDURE                   ADVANCE.ACTIVITY_EMAIL1
 as    

    cursor test_cur is 
    SELECT activity_code,
           full_desc,
           activity_date,
           activity_email
      FROM activities_yesterday;
    
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
                   'You have 21 days to fix this stuff up fool or Bryan Mack will pop a cap in yo azz'||
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
               oia_sendmail_cc('Activity Update Warning - Action Required!',message,'genius_dba@minesfoundation.net',activity_email,'fleetmack@gmail.com');
            else
   dbms_output.put_line('no length ');
            end if;

end;
    
end;