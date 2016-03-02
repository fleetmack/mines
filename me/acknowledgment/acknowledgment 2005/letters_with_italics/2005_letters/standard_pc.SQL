/**************************/
/*** Standard PC Letter ***/
/**************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
   'It is my great pleasure to take this opportunity to thank you for your generous gift to '||
   'Colorado School of Mines.  In recognition of your'||
   DECODE(ack_segment, 'Gugg', ' extraordinary ', ' ')||
   'contribution, I would like to welcome '||
   'you to the '||
   society||
   ' Society of the 2004-2005 Mines President'||
   CHR(39)||
   's Council, a select '||
   'group of our most distinguished and loyal donors.'||
   DECODE(ack_segment, 'Gugg', '  I truly hope to have '||
                               'the opportunity to thank you personally in the near future.',
                  'Parent PC', '  In addition to the investment of '||
                               'sending your CHILD/CHILDREN to Mines, we appreciate your kindness.',
                               '  ')||
CHR(13)||
CHR(13)||
   'Your gift, as part of '
   WHERE  ack_segment            IN ('Gugg','Parent PC', 'PC', 'Pledge Payment PC')
     AND  signer                 = 'Pres'
     AND  ack_letter1            IS NULL;
COMMIT;
/

UPDATE a_ack_rcpt
   SET ack_letter2 =
   'Transforming Resources:  The Campaign for Mines'
   WHERE  ack_segment            IN ('Gugg','Parent PC', 'PC', 'Pledge Payment PC')
     AND  signer                 = 'Pres'
     AND  ack_letter2            IS NULL;
COMMIT;
/

UPDATE a_ack_rcpt
   SET ack_letter3 =
   ', is an essential '||
   'component of our ongoing efforts to build upon traditional strengths and take advantage '||
   'of exciting new opportunities.  Private gifts are a fundamental part of our ability to ensure '||
   'that Mines continues to deliver a superior education.  Your support directly affects our '||
   'students by providing the latest technology, improving academic programs, recruiting and '||
   'retaining the best faculty, and funding scholarships.'||
CHR(13)||
CHR(13)||
   'The result of the generous philanthropy of our valued alumni'||
   DECODE(ack_segment,'Parent PC', ', friends and parents',
                                   ' and friends')||
   ' is a dynamic '||
   'institution that continues to flourish.  We are grateful that you have chosen to '||
   'support Mines'||
   DECODE(ack_segment,'Gugg',' in such a notable way.  Know that your exceptional gift will make a significant '||
                             'impact.',
                             '.  Know that your gift will make an impact.')||
CHR(13)||
CHR(13)||
   'Thank you for your generosity.'
   WHERE  ack_segment            IN ('Gugg','Parent PC', 'PC', 'Pledge Payment PC')
     AND  signer                 = 'Pres'
     AND  ack_letter3            IS NULL;
COMMIT;
/
/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for PC Gift'
 WHERE     signer        = 'Pres'
   AND     ack_segment   IN ('Gugg','Parent PC','PC','Pledge Payment PC')
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
