/**************************/
/*** Athletic PC Letter ***/
/**************************/
UPDATE    
   SET    ack_letter1_temp            =
   'I am writing to express my appreciation for your generous '||
   LOWER(transaction_type_desc)||
   ' to Colorado School of '||
   'Mines Athletic Department.  Your support plays a vital role in the continued development '||
   DECODE (transaction_type, 'P', 'After payments on your pledge are completed this fiscal year, you will '||
                                  'become an honored member of the '
                                , 'In addition to your Silver and Blue membership, I welcome you '||
                                  'to the '
                               ')||
   society||
   ' Society of the 2002-2003 Mines President'||
   CHR(39)||
   's Council, a select '||
   'group of the School'||
   CHR(39)||
   's most generous donors.'||
   CHR(13)||
   CHR(13)||
   'Historically, sports and physical activity have always been a large part of student life at '||
   'Mines.  Team sports teach important lessons'||
   CHR(58)||
   'collaboration, communication, and '||
   'leadership.  Furthermore, athletics provides a healthy outlet for the stress of Mines'||
   CHR(39)||
   'rigorous academic demands.  Your support helps the School fulfill an important part of'||
   'its educational philosophy'||
   CHR(151)||
   'instilling lifelong fitness habits'||
   CHR(13)||
   CHR(13)||
   'Thank you for supporting the school in this important way. '||
    WHERE  ack_segment            IN ('Athletic PC')
     AND  ack_letter1_temp            IS NULL;
COMMIT;
/
/**********************************************************************/
/*** Indicate if no letter was generated for a PC President Segment ***/
/**********************************************************************/
UPDATE     a_ack_rcpt_temp
   SET     ack_letter1_temp   = 'No letter generated for PC President Gift'
 WHERE     signer        = 'Pres'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
