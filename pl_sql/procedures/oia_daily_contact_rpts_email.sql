CREATE OR REPLACE procedure ADVANCE.OIA_DAILY_CONTACT_RPTS_EMAIL
(
    i_id_number varchar2,
    i_email varchar2
) as    

    cursor test_cur is 
    select c.id_number,
           e.pref_mail_name,
           t.full_desc , 
           c.description,
           c.contacted_comment,
           a.pref_mail_name as author_name,
           SUBSTR(TO_CHAR(c.contact_date,'YYYYMMDD'),5,2)||'/'||SUBSTR(TO_CHAR(c.contact_date,'YYYYMMDD'),7,2)||'/'||SUBSTR(TO_CHAR(c.contact_date,'YYYYMMDD'),3,2) as contact_date,
           DECODE(c.contact_outcome,'MOVE',' - MOVE',' ') as contact_outcome,
           NVL((SELECT MAX(o.pref_mail_name) from entity o, contact_rpt_credit cr where cr.report_id = c.report_id and cr.id_number = o.id_number and cr.author_ind = 'N'),' ') as other_contact,
           NVL((SELECT MIN(DECODE(t.month_out,' ',DECODE(t.qual_month_out,' ','3. Potential Prospect','2. Initial Prospect'),'1. Qualified Prospect'))
                  FROM a_dw_pros_man t
                 WHERE t.stage_code NOT IN ('CA','CR','D','ST')
                   AND t.prospect_type <> 'B'
                   AND t.pros_active_ind = 'Y'
                   AND t.prop_active_ind = 'Y'
                   AND t.id_number = c.id_number),'3. Potential Prospect') as sort_group
      from contact_report       c,
           entity               e,
           entity               a,
           tms_contact_rpt_type t
     where to_char(c.date_modified,'YYYYMMDD')      >= to_char(sysdate- 1,'YYYYMMDD')
       and to_char(c.date_added,'YYYYMMDD')      >= to_char(sysdate- 60,'YYYYMMDD')
       and c.contact_date       < sysdate
       and c.id_number          = e.id_number
       and c.author_id_number   = a.id_number
       and c.contact_type       = t.contact_type
       and c.contact_initiated_by NOT IN('MASS','BOG')
  ORDER BY sort_group, TO_CHAR(c.contact_date,'YYYYMMDD'), a.pref_mail_name;
    
    id_number varchar2(10);
    pref_mail_name varchar2(70);
    full_desc varchar2(60);
    description varchar2(120);
    contacted_comment varchar2(250);
    author_name varchar2(70);
    contact_date varchar2(10);
    contact_outcome varchar2(10);
    other_contact varchar2(70);
    sort_group varchar2(70);
    
    crlf         CONSTANT VARCHAR2(2):= CHR(13) || CHR(10);
    message varchar2(30000) := 'These are the contact reports filed or modified yesterday.'||crlf||crlf;
    message3 varchar2(30000) := message;
    
begin
    Dbms_Output.ENABLE(1000000);
    open test_cur;
    
    loop
        fetch test_cur into id_number, pref_mail_name, full_desc, description, contacted_comment, author_name, contact_date, contact_outcome, other_contact,sort_group;
        exit when test_cur%notfound;
        
        --dbms_output.put_line(id_number || ', ' || pref_mail_name);
        message := message||sort_group||crlf||
                   id_number||' '||pref_mail_name||' '||contact_outcome||crlf||
                   '  '||full_desc||' - '||description||' '||contacted_comment||crlf||
                   '  '||author_name||' '||contact_date||crlf||'  '||other_contact||crlf||crlf;
    end loop;
    
    close test_cur;
    
declare
            message2 varchar2(30000) := message;
begin

            dbms_output.enable(30000);
            if (message2 <> message3) then
               --         dbms_output.put_line('length '||substr(message,1,100));
               oia_sendmail('Contact Reports Entered or Modified Yesterday ',message,'jstarrit@mines.edu',i_email);
            else
                        dbms_output.put_line('no length ');
            end if;

end;
    
end;
