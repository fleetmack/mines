CREATE OR REPLACE PACKAGE ADVANCE.activity_email_deactivate IS
PROCEDURE ACTIVITY_EMAIL_TABLE;
PROCEDURE ACTIVITY_EMAIL1;
PROCEDURE ACTIVITY_EMAIL2;
PROCEDURE ACTIVITY_EMAIL3;
PROCEDURE ACTIVITY_UPDATE_PAST;
END;

CREATE OR REPLACE PACKAGE BODY ADVANCE.activity_email_deactivate is
PROCEDURE activity_email_table
IS
dyn_sql VARCHAR2(32767);
BEGIN 
dyn_sql := 'DROP TABLE activities_yesterday';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'COMMIT';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'create table activities_yesterday 
 as
(select t.activity_code, ltrim(substr(t.short_desc,(length(t.short_desc)-7),8)) activity_date, t.xcomment activity_email, t.full_desc, ''1'' email_number
from tms_activity_table t
where ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)) = to_char(sysdate-1,''YYYYMMDD''))';
EXECUTE IMMEDIATE dyn_sql; 

dyn_sql := 'COMMIT';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'insert into activities_yesterday
(select t.activity_code, ltrim(substr(t.short_desc,(length(t.short_desc)-7),8)) activity_date, t.xcomment activity_email, t.full_desc, ''2'' email_number
from tms_activity_table t
where ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)) = to_char(sysdate-14,''YYYYMMDD'')
and t.xcomment like ''%@%'')';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'COMMIT';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'insert into activities_yesterday
(select t.activity_code, ltrim(substr(t.short_desc,(length(t.short_desc)-7),8)) activity_date, t.xcomment activity_email, t.full_desc, ''3'' email_number
from tms_activity_table t
where ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)) = to_char(sysdate-21,''YYYYMMDD'')
and t.xcomment like ''%@%'')';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'COMMIT';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'insert into activities_yesterday
(select t.activity_code, ltrim(substr(t.short_desc,(length(t.short_desc)-7),8)) activity_date, t.xcomment activity_email, t.full_desc, ''4'' email_number
from tms_activity_table t
where ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)) = to_char(sysdate-22,''YYYYMMDD'')
and t.xcomment like ''%@%'')';
EXECUTE IMMEDIATE dyn_sql;

dyn_sql := 'COMMIT';
EXECUTE IMMEDIATE dyn_sql;

END activity_email_table;
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
   'Activity Deactivation Warning #1'||crlf;
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
                   'Please refer to the following document for full details I:\OIA\oia (shared)\Policies and Procedures (documentation)\Advancement Services\Advance Training\Activity Maintenance.docx'||
                    crlf||crlf||
                    'To sum it up, you basically need to do the following: '||
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
               oia_sendmail_cc(full_desc||' Deactivation Warning #1! '||activity_code,message,'genius_dba@minesfoundation.net',activity_email,'bmack@exchange.mines.edu');
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
   'Activity Deactivation Warning #2'||crlf||crlf;
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
                   crlf||crlf||
                   'Assignee :  '||activity_email||
                    crlf||crlf||
                   'You have 7 more days to adjust this activity.'||
                    crlf||crlf||
                   'Please refer to the following document for full details I:\OIA\oia (shared)\Policies and Procedures (documentation)\Advancement Services\Advance Training\Activity Maintenance.docx'||crlf||crlf||crlf||crlf;
    end loop;
    
    close test_cur;
    
declare
            message2 varchar2(30000) := message;
begin

            dbms_output.enable(30000);
            if (message2 <> message3) then
               --         dbms_output.put_line('length '||substr(message,1,100));
               oia_sendmail_cc(full_desc||' Deactivation Warning #2! '||activity_code,message,'genius_dba@minesfoundation.net',activity_email,'bmack@exchange.mines.edu');
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
   'Final Deactivation Warning!'||crlf||crlf;
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
                   crlf||crlf||
                   'Assignee :  '||activity_email||
                    crlf||crlf||
                    'ACTION IS REQUIRED OF YOU UNLESS YOU HAVE DONE SO ALREADY!!'||
                    crlf||crlf||
                    'Please adjust activity participation codes as needed.  This activity will not be able to be updated after this evening!'||
                    crlf||crlf||
                   'You have until 5pm tonight to update this activity!! It will be automatically updated and deactivated at 5:30am tomorrow!'||
                    crlf||crlf||
                   'Please refer to the following document for full details I:\OIA\oia (shared)\Policies and Procedures (documentation)\Advancement Services\Advance Training\Activity Maintenance.docx'||crlf||crlf||crlf||crlf;
    end loop;
    
    close test_cur;
    
declare
            message2 varchar2(30000) := message;
begin

            dbms_output.enable(30000);
            if (message2 <> message3) then
               --         dbms_output.put_line('length '||substr(message,1,100));
               oia_sendmail_cc(full_desc||' Final Warning! '||activity_code,message,'genius_dba@minesfoundation.net',activity_email,'bmack@exchange.mines.edu');
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
