CREATE OR REPLACE procedure ADVANCE.OIA_DAILY_BEHALF_EMAIL
(
    i_id_number IN varchar2,
    i_email IN varchar2
) as    

    cursor test_cur is 
     select p.id_number, 
            p.pref_mail_name, 
            p.transaction_type,       
            '$'||to_char(d.associated_amount) as associated_amount, 
            NVL((select j.employer_name1 from a_dw_jobs j where p.id_number = j.id_number and j.employ_relat_code = 'PE'),' ') as employer_name,
            NVL((select j.job_title from a_dw_jobs j where p.id_number = j.id_number and j.employ_relat_code = 'PE'),' ') as job_title,
            d.pref_mail_name as donor_name,
            DECODE(d.person_or_org,'P','Individual','O','Corporate') as cfae_count_as,
            t.short_desc  as donor_type,
            DECODE(d.person_or_org,'P','Individual', DECODE(d.record_type_code,'FD','Individual','T','Individual','Corporate')) as count_as
       from a_dw_pyramid p,
            a_dw_pyramid d,
            tms_record_type t
       where p.date_of_record >= '20100701'
       and p.associated_code = 'B'
       and p.receipt = d.receipt
       and d.associated_code = 'P'
       and d.transaction_type NOT IN ('MG','MC')
       and d.record_type_code = t.record_type_code
       and d.person_or_org <> p.person_or_org
       and p.date_of_record     >= to_char(sysdate-1,'YYYYMMDD')
       order by p.receipt;
        
    id_number varchar2(11);
    pref_mail_name varchar2(70);
    transaction_type varchar2(2);
    associated_amount varchar2(30);
    employer_name varchar2(70);
    job_title varchar2(70);
    donor_name varchar2(80);
    cfae_count_as varchar2(30);
    donor_type varchar2(30);
    count_as varchar2(30);
    
    crlf         CONSTANT VARCHAR2(2):= CHR(13) || CHR(10);
    message varchar2(30000) := 'These are the behalf gifts made yesterday.'||crlf||
                               'Please review and inform Adv. Services if transaction needs coded for campaign counting change.  '||
                               'Note that if a pledge payment needs changed the original pledge may need to be coded for commitment reasons.'||crlf||crlf;
    message3 varchar2(30000) := message;
    
begin
--dbms_output.put_line('procedure starting'||i_id_number||i_email);
--    Dbms_Output.ENABLE(1000000);
    open test_cur;
    
    loop
        fetch test_cur into id_number, pref_mail_name, transaction_type, associated_amount, employer_name, job_title, donor_name, cfae_count_as, donor_type, count_as;
        exit when test_cur%notfound;
        
 --       dbms_output.put_line(id_number || ', ' || pref_mail_name);
        message := message||
                   '______________________________________________________________'||crlf||
                   donor_name||'    '||donor_type||crlf||
                   '  Transaction Type - '||transaction_type||crlf||
                   '  Amount - '||associated_amount||crlf||
                   '     On behalf of '||pref_mail_name||crlf||
                   '                               Employer:  '||employer_name||crlf||
                   '                               Job Title: '||job_title||crlf||crlf||
                   '   Will count in CFAE counting as - '||cfae_count_as||crlf||
                   '   Will count in campaign counting as - '||count_as||crlf||crlf;
    end loop;
    
    close test_cur;
    
declare
            message2 varchar2(32000) := message;
begin

 --           dbms_output.enable(1000000);
            if (message2 <> message3) then
 --                      dbms_output.put_line('length '||substr(message,1,100));
               oia_sendmail('Daily Behalf Review',message,'jstarrit@mines.edu',i_email);
            else
                        dbms_output.put_line('no length ');
            end if;

end;
    
end;
