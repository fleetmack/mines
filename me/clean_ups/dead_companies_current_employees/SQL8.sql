/*** Deceased or Purgable Company still has current employees ***/
INSERT INTO a_data_errors
(select e.id_number, 
        ' ',
        e.pref_mail_name,
        'Company status code is Purgable or Deceased',
        'Company still has current employees linked to it',
        'Fix employees of this company to show no employer or new employer ID',
        'See Bryan with questions',
        e.operator_name,
        ' ',
        to_char(e.date_modified,'YYYYMMDD')
    from entity e
   where e.record_status_code <> 'A'
     and id_number in
        (select employer_id_number
           from employment
          where job_status_code = 'C'));
COMMIT;