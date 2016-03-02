/*******************************************/
/*** President Bequest Expectancy Letter ***/
/*******************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 
           'It is with very special pleasure that I thank you for confirming your intention to direct a '||
           'bequest to Mines.  Your generosity and your participation in the '
 WHERE      ack_segment   IN ('Bequest Ex')
   AND     signer        = 'Pres';
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     ack_letter2 =
           'Transforming Resources '
 WHERE     ack_segment   IN ('Bequest Ex')
   AND     signer        = 'Pres';
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     ack_letter3 = 
           'campaign are greatly appreciated.'||
           CHR(13)||
           CHR(13)||
           'Bequests and other long-term support link the past with the future, enabling the School to '||
           'build upon its traditional strengths and to open new avenues of achievement.  Because of your '||
           'thoughtfulness, we can look forward to offering students an educational experience that will '||
           'be even richer and more stimulating than it is today.'||
           CHR(13)||
           CHR(13)||
           'We are grateful that you have chosen to include Mines among your highest personal and '||
           'philanthropic priorities.  We are mindful of the honor you have conferred on us, and will work '||
           'hard to validate your trust and loyalty.'
WHERE      ack_segment   IN ('Bequest Ex')
   AND     signer        = 'Pres';
COMMIT;
/

/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Bequest'
 WHERE     signer        = 'Pres'
   AND     ack_segment   = 'Bequest Ex'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;