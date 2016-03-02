/*************************/
/*** PC Bequest Letter ***/
/*************************/
UPDATE     
   SET     ack_letter1_temp   = 
           'Dear EXECUTOR:'||
           CHR(13)||
           CHR(13)||
           'I was very grateful to learn of the recent bequest from the estate of '||
           RTRIM(pref_mail_name,' [D]')||
           ' to Mines.  We are honored by '||
           bequest_hisher||
           ' extraordinary generosity and proud to claim '||
           bequest_himher||
           ' as '||
           DECODE(record_type_code, 'AL', 'an alumnus and a friend of the School. '
                                       , 'a friend of the School. ')||
           CHR(13)||
           CHR(13)||
           'Each year Mines receives a substantial portion of its overall support in the form of bequests '||
           'from alumni and friends.  Bequests provide unrestricted funds for current needs of students, '||
           'targeted support for specific departments and initiatives, and endowments that assure the '||
           'long-term stability of the School.'||
           CHR(13)||
           CHR(13)||
           'We are honored by the thoughtful planning and generosity that '||
           salutation||
           CHR(39)||
           's very special gift represents.  I am proud to serve an institution that commands such '||
           'loyalty and respect from those who know it best.'
WHERE      ack_segment   IN ('PC Bequest')
   AND     ack_letter1_temp   IS NULL;
COMMIT;
/
WHERE      ack_segment   IN ('PC Bequest')
   AND     ack_letter1_temp   IS NULL;
COMMIT;
/