/**** Fix Canadian Addresses - give these to Jo Marie ***/
select *
from a_dw_address_good
where (h_foreign_cityzip not like '%BC%'
           and h_foreign_cityzip not like '%ON%'
           and h_foreign_cityzip not like '%SK%'
           and h_foreign_cityzip not like '%QC%'
           and h_foreign_cityzip not like '%YT%'
           and h_foreign_cityzip not like '%AB%'
           and h_foreign_cityzip not like '%NS%'
      --     or p_foreign_cityzip not like '%
            )
and h_country_code = 'CD';

/**** Fix Canadian Addresses - give these to Jo Marie ***/
select *
from a_dw_address_good
where (b_foreign_cityzip not like '%BC%'
           and b_foreign_cityzip not like '%ON%'
           and b_foreign_cityzip not like '%SK%'
           and b_foreign_cityzip not like '%QC%'
           and b_foreign_cityzip not like '%YT%'
           and b_foreign_cityzip not like '%AB%'
           and b_foreign_cityzip not like '%NS%'
      --     or p_foreign_cityzip not like '%
            )
and b_country_code = 'CD';



  /*** Possible Bad Canadian Address - Missing or Incorrect Province ***/
  INSERT INTO a_data_errors
      (SELECT e.id_number,
              ' ',
              e.pref_mail_name,
              m_table,
              'Possible Bad Canadian Address - '||t.long_desc,
              'Province may be incorrect',
              'See Bryan with questions',
              a.operator_name,
              ' ',
              TO_CHAR(a.date_modified,'YYYYMMDD')
         FROM entity                e,
              address               a,
              tms_address_type      t
        WHERE e.id_number           = a.id_number
          AND e.record_status_code  = 'A'
          AND a.addr_type_code      = t.addr_type_code
          AND a.country_code        = 'CD'
          AND a.foreign_cityzip     NOT LIKE '%BC%'
          AND a.foreign_cityzip     NOT LIKE '%ON%'
          AND a.foreign_cityzip     NOT LIKE '%SK%'
          AND a.foreign_cityzip     NOT LIKE '%QC%'
          AND a.foreign_cityzip     NOT LIKE '%YT%'
          AND a.foreign_cityzip     NOT LIKE '%AB%'
          AND a.foreign_cityzip     NOT LIKE '%NS%'
          AND a.date_modified       >= m_date);
  COMMIT;