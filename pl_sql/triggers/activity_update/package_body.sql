CREATE OR REPLACE PACKAGE BODY activity_email_deactivate is
PROCEDURE   ACTIVITY_EMAIL1
 as    
    cursor test_cur is 
    SELECT activity_code,
           full_desc,
           activity_date,
           activity_email
      FROM activities_yesterday
  WHERE email_number = '1';
   
    activity_code varchar2(10);
    full_desc varchar2(255);
    activity_date  varchar2(8);
    activity_email  varchar2(40);
    
    crlf         CONSTANT VARCHAR2(2):= CHR(13) || CHR(10);
   message varchar2(30000) := 
   'Activity Deactivation Warning!'||crlf;
   message3 varchar2(30000) := message;
    
begin
    Dbms_Output.ENABLE(1000000);
    open test_cur;
    
    loop
        fetch test_cur into activity_code, full_desc, activity_date, activity_email;
        exit when test_cur%notfound;
        
        --dbms_output.put_line(id_number || ', ' || pref_mail_name);
        message := message||crlf||crlf||
                    'Activity assigned to:  '||activity_email||'.'||'   Email CC''d to bmack@exchange.mines.edu'||crlf||crlf||
                    'The event '||activity_code||' -- '||full_desc||' took place yesterday.  It will be deactivated at the following time: '||to_char(sysdate+21,'FMMonth DD, YYYY HH12:MI AM')||'.  After deactivation, no further updates may be made to this activity.'||
                   crlf||crlf||
                   'Before '||to_char(sysdate+21,'FMMonth DD, YYYY HH12:MI AM')||' you need to do the following for activity '||activity_code||' -- '||full_desc||':'||
                    crlf||crlf||
                   '**Change everyone who accepted the inviation''s participation code to either IX (Invited/Accepted) or IA (Invited/Attended)'||
                    crlf||crlf||
                   '**Change everyone who accepted the invitation but DID NOT SHOW UP TO THE EVENT to IN (Invited, Accepted, Didn''t attend)'||
                    crlf||crlf||
                    '**Also make certain you have everyone marked as D (Declined) or ID (Declined Don''t Invite Again) where needed by '||to_char(sysdate+21,'FMMonth DD, YYYY HH12:MI AM')||
                    crlf||crlf||
                    'On '||to_char(sysdate+21,'FMMonth DD, YYYY HH12:MI AM')||' this activity will be automatically and systematically updated.  The automatic portion of this update occuring on '||to_char(sysdate+21,'FMMonth DD, YYYY HH12:MI AM')||' will '||                     'involve changing all I''s to NR''s, and changing anyone listed as IX to IA.  Any updates to this data not entered by then will not show up on Advance reports.'||crlf||crlf||crlf||crlf;
    end loop;
    
    close test_cur;
    
declare
            message2 varchar2(30000) := message;
begin

            dbms_output.enable(30000);
            if (message2 <> message3) then
               --         dbms_output.put_line('length '||substr(message,1,100));
               oia_sendmail_cc(full_desc||' REMOVAL!',message,'genius_dba@minesfoundation.net',activity_email,'bmack@exchange.mines.edu');
            else
   dbms_output.put_line('no length ');
            end if;

end;
    
end ACTIVITY_EMAIL1;
PROCEDURE                   ACTIVITY_EMAIL2
 as    

    cursor test_cur is 
    SELECT activity_code,
           full_desc,
           activity_date,
           activity_email
      FROM activities_yesterday
  WHERE email_number = '2';
    
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
                   'You have 7 MORE DAYS to fix this stuff up fool or Bryan Mack will pop a cap in yo azz'||
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
               oia_sendmail_cc('Activity Reminder #2 - Action Required! '||activity_code,message,'genius_dba@minesfoundation.net',activity_email,'bmack@exchange.mines.edu');
            else
   dbms_output.put_line('no length ');
            end if;

end;
    
end ACTIVITY_EMAIL2;
PROCEDURE                   ACTIVITY_EMAIL3
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
               oia_sendmail_cc('Activity FINAL REMINDER! '||activity_code,message,'genius_dba@minesfoundation.net',activity_email,'bmack@exchange.mines.edu');
            else
   dbms_output.put_line('no length ');
            end if;

end;
    
end ACTIVITY_EMAIL3;
procedure activity_update_past
IS
BEGIN

update activity
     set activity_participation_code = 'NR'
where activity_participation_code = 'I'
and activity_code IN
        (select activity_code
            from activities_yesterday
            where email_number = '4');


update activity
     set activity_participation_code = 'IA'
where activity_participation_code = 'IX'
and activity_code IN
        (select activity_code
            from activities_yesterday
            where email_number = '4');

update tms_activity_table
    set status_code = 'I'
where activity_code IN
    (select activity_code
       from activities_yesterday
    where email_number = '4');
COMMIT;
END activity_update_past;
END;
/