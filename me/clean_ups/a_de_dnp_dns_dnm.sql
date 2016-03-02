/*** Person's Entry has DNM status, but spouse does not ***/
INSERT INTO a_data_errors
(select e.id_number,
        ' ',
        m_table,
        'Mailing Code listed as DNM while spouse is not',
        'Keep mail list code consistent between spouses',
        'See Bryan with Questions',
        m.operator_name,
        ' ',
        TO_CHAR(m.date_modified,'YYYYMMDD')
from mailing_list   m,
     entity         e
where e.id_number   = m.id_number
and   m.mail_list_code = 'DNM'
and   e.record_status_code = 'A'
and   e.spouse_id_number > ' '
and   e.spouse_id_number not in
    (select m2.id_number
       from mailing_list    m2
      where m2.mail_list_code = 'DNM'
        and m2.id_number in
            (select e2.id_number
               from entity  e2
              where e2.record_status_code = 'A'
              and e2.spouse_id_number > ' ')));