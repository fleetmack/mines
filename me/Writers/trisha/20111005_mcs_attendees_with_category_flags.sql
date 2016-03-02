/*** Email List of MCS Attendees broken down by who they are flags ***/
select dw.id_number,
       dw.record_type_code,
       dw.pref_mail_name,
       dw.pref_name_sort,
       dw.salutation,
       nvl(dw.p_email_address,' '),
       (CASE
        WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc11 = '1') THEN 'X'
        ELSE ' '
        END) pc11,
       (CASE
        WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc12 = '1') THEN 'X'
        ELSE ' '
        END) pc12,
       (CASE
        WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where heritage_society = '1') THEN 'X'
        ELSE ' '
        END) heritage_society,
       (CASE
        WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where flag_cs = '1') THEN 'X'
        ELSE ' '
        END) mcs,
       (CASE
        WHEN dw.id_number IN (SELECT  id_number 
                                FROM  employment                       e
                                WHERE e.employ_relat_code              NOT IN ('FS','ST')
                                  AND e.employer_id_number             IN
                                (SELECT  id_number 
                                   FROM a_dw_faculty_staff_org_ids))
        THEN 'X'
        ELSE ' '
        END) faculty_staff                                   
  from a_dw_address_good dw,
       activity           a
 where dw.id_number(+) = a.id_number
   and a.activity_code = 'C370'
   and a.activity_participation_code = 'IA'
order by dw.pref_name_sort   