/**************************/
/*** Athletic PC Letter ***/
/**************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
   'It is my great pleasure to take this opportunity to thank you for your generous '||
   LOWER(transaction_type_desc)||
   ' to the '||
   'Colorado School of Mines Athletic Department.  In addition to your Silver and Blue '||
   'membership, I would like to welcome you to the '||
   society||
   ' Society of the 2004-'||
   '2005 Mines President'||
   CHR(39)||
   's Council, a select group of our most distinguished and loyal '||
   'donors.'||
   CHR(13)||
   CHR(13)||
   'Your '||
   lower(transaction_type_desc)||
   ', as part of '
   WHERE  ack_segment            IN ('Athletic PC')
     AND  ack_letter1            IS NULL;
COMMIT;
/

UPDATE    a_ack_rcpt
   SET    ack_letter2 =
   'Transforming Resources: The Campaign for Mines '
   WHERE  ack_segment            IN ('Athletic PC')
     AND  ack_letter2            IS NULL;
COMMIT;
/

UPDATE    a_ack_rcpt
   SET    ack_letter3 =
   ', is an essential '||
   'component of our ongoing efforts to build upon traditional strengths and take advantage '||
   'of our exciting new opportunities.  Private gifts to the Athletic Department are a fundamental '||
   'part of our ability to ensure that Mines continues to offer an important aspect of the '||
   'college experience.  Participation in athletics encourages teamwork, discipline, and '||
   'involvement in campus life'||
   CHR(45)||
   'all important cornerstones of a Mines education.  Your '||
   'support directly affects our sudent-athletes and provides them with the option to meet '||
   'goals outside of the classroom.'||
   CHR(13)||
   CHR(13)||
   'The result of the generous philanthropy of our valued alumni and friends is a dynamic '||
   'institution that continues to flourish.  We are grateful that you have chosen to support '||
   'Mines Athletics.  Know that your gift will make an impact.'||
   CHR(13)||
   CHR(13)||
   'Thank you for your generosity.'
    WHERE  ack_segment            IN ('Athletic PC')
     AND  ack_letter3            IS NULL;
COMMIT;
/
/**********************************************************************/
/*** Indicate if no letter was generated for a PC President Segment ***/
/**********************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Athletic PC'
 WHERE     signer        = 'Pres'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
