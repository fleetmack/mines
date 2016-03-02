CREATE OR REPLACE PROCEDURE                           ADVANCE.OIA_DAILY_PC2_EMAIL_FY12
 as    

    cursor test_cur is 
    SELECT id_number,
           pref_mail_name,
           date_of_record,
           gifts,
           pc2_email1,
           pc2_email2,
           pc2_email3,
           pc2_email4,
           pc2_email5
      FROM a_ack_rcpt3    
     WHERE date_of_record = to_char(sysdate-1,'YYYYMMDD');
    
    id_number varchar2(10);
    pref_mail_name varchar2(70);
    date_of_record  varchar2(8);
    gifts  varchar2(255);
    pc2_email1 varchar2(80);
    pc2_email2 varchar2(80);
    pc2_email3 varchar2(80);
    pc2_email4 varchar2(80);
    pc2_email5 varchar2(80);
    
    crlf         CONSTANT VARCHAR2(2):= CHR(13) || CHR(10);
   message varchar2(30000) := 
'The following donor made a second PC gift this fiscal year:'||crlf||crlf;
   message3 varchar2(30000) := message;
    
begin
    Dbms_Output.ENABLE(1000000);
    open test_cur;
    
    loop
        fetch test_cur into id_number, pref_mail_name, date_of_record, gifts, pc2_email1, pc2_email2, pc2_email3, pc2_email4, pc2_email5;
        exit when test_cur%notfound;
        
        --dbms_output.put_line(id_number || ', ' || pref_mail_name);
        message := message||crlf||
                   id_number||'   '||pref_mail_name||
                   crlf||
                   'Date of Gift:  '||substr(date_of_record,5,2)||'-'||substr(date_of_record,7,2)||'-'||substr(date_of_record,1,4)||crlf||
                   'Gifts with Allocations: '||gifts||crlf||
                   'This serves as notice, per the acknowledgment process, that the prospect manager is to determine proper follow-up for this gift.';
    end loop;
    
    close test_cur;
    
declare
            message2 varchar2(30000) := message;
begin

            dbms_output.enable(30000);
            if (message2 <> message3) then
               --         dbms_output.put_line('length '||substr(message,1,100));
               oia_sendmail_cc4('Daily Second PC Gift report',message,'bmack@mines.edu',pc2_email1,pc2_email2, pc2_email3, pc2_email4, pc2_email5);
            else
   dbms_output.put_line('no length ');
            end if;

end;
    
end;