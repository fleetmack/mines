/***Looks for Care Of data that is placed in the Street Field***/
 INSERT INTO a_data_errors
      (SELECT e.id_number,
              ' ',
              e.pref_mail_name,
              m_table,
              'Street 1 contains - c/o - no care of information allowed in this field on address type - '||t.long_desc,
              'Move Street 1 information to Care Of Field and move any other information up',
              'See John for further questions',
              a.operator_name,
              ' ',
              TO_CHAR(a.date_modified,'YYYYMMDD')
         FROM entity                e,
              address               a,
              tms_address_type      t
        WHERE e.id_number           = a.id_number
            AND t.addr_type_code    = a.addr_type_code
            AND LOWER(street1) LIKE 'c/o %'                    
            AND a.date_modified       >= m_date );
  COMMIT;
/

