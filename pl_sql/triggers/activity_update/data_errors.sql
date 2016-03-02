  /*** Activity created with invalid date ***/
    INSERT INTO a_data_errors
        (SELECT t.activity_code,
        ' ',
        t.full_desc,
        m_table,
        'Activity created with invalid activity date',
        'The last 8 characters of the full description MUST be a valid YYYYMMDD',
        'See Bryan with questions',
        t.operator,
         ' ',
        TO_CHAR(t.added,'YYYYMMDD')
            FROM tms_activity_table       t
           WHERE (substr(ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)),1,2) <> '20'
                    or substr(ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)),5,2) = '00'
                    or substr(ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)),5,2) >= '13'
                    or substr(ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)),7,2) = '00'
                    or substr(ltrim(substr(t.full_desc,(length(t.full_desc)-7),8)),7,2) >= '32')
             AND t.added >= sysdate-14);
        COMMIT;


  /*** Activity created without Activity Owner Email Address ***/
    INSERT INTO a_data_errors
        (SELECT t.activity_code,
        ' ',
        t.full_desc,
        m_table,
        'Activity created without Activity Owner Email Address',
        'Add email address to this activity in the xcomment field',
        'See Bryan with questions',
        t.operator,
         ' ',
        TO_CHAR(t.added,'YYYYMMDD')
            FROM tms_activity_table       t
            where  t.xcomment NOT LIKE '%@%'
                and t.added >= sysdate-14);
        COMMIT;