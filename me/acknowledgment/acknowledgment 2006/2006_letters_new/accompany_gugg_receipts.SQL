/*****************************/
/***Accompany Gugg Receipts***/
/*****************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
DECODE(transaction_type,'GF','Thank you for your extraordinary gift to Colorado School of Mines.  While we are '||
                             'sending the enclosed receipt for tax purposes, I would like to take a moment to personally '||
                             'acknowledge your generosity and your remarkable impact on the School.'||
                             CHR(13)||
                             CHR(13)||
                             'Your contribution, as part of ',
                         'P','Thank you for your extraordinary commitment to Colorado School of Mines.  We are '||
                             'sending the enclosed pledge statement for your records.  '||
                             CHR(13)||
                             CHR(13)||
                             'On behalf of the entire Mines community, I appreciate your generous pledge to ')
   WHERE  ack_segment            IN ('Accompany')
     AND  signer                 = 'VP Gugg'
     AND  ack_letter1            IS NULL;
COMMIT;
/
                             
UPDATE    a_ack_rcpt
   SET    ack_letter2 =                          
          'Transforming Resources: The Campaign for Mines'
   WHERE  ack_segment            IN ('Accompany')
     AND  signer                 = 'VP Gugg'
     AND  ack_letter2            IS NULL;
COMMIT;
/
          
UPDATE    a_ack_rcpt
   SET    ack_letter3 =
DECODE(transaction_type,'GF',', brings '||
                             'us closer to our goal of $125 million.  The success of this campaign will ensure that our '||
                             'students have the most up-to-date technologies, the best faculty, and greater opportunities '||
                             'for scholarships.  Even with the challenges that higher education faces in today'||
                             CHR(39)||
                             's '||
                             'uncertain economic climate, we are more confident than ever that the loyalty and '||
                             'leadership demonstrated by our alumni and friends will allow Mines to continue to '||
                             'provide an engineering and applied science education of the highest quality.'||
                             CHR(13)||
                             CHR(13)||
                             'We are exceptionally grateful for your dedication to Colorado School of Mines and '||
                             'appreciate the vital role you play in the future of tomorrow'||
                             CHR(39)||
                             's leaders.',
                         'P','.  Your participation in the campaign '||
                             'comes at a decisive period for the advancement of the School.  Because of the leadership '||
                             'and dedication of our loyal donors, Colorado School of Mines continues to maintain its '||
                             'position at the forefront of engineering and applied science education.  '||
                             CHR(13)||
                             CHR(13)||
                             'For your convenience, you will receive periodic reminders of our fiscal year end, June '||
                             '30, 2006.'||
                             CHR(13)||
                             CHR(13)||
                             'Once again, thank you for strengthening the future of Mines and its students.')
   WHERE  ack_segment            IN ('Accompany')
     AND  signer                 = 'VP Gugg'
     AND  ack_letter3            IS NULL;
COMMIT;
/

/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Gugg Accompany VP Letter'
 WHERE     ack_segment   = 'Accompany'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
