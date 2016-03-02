/************************************/
/*** VP Bequest Expectancy Letter ***/
/************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 
           'Thank you for providing bequest documentation in support of the Transforming Resources '||
           'campaign.  The estimated current value of '||
           REPLACE(gift, '.00', '')||
           ' that you indicated will be included in campaign '||
           ' totals as a deferred gift.  Of course, we understand that the value of such long-term interests, and the '||
           'amount ultimately realized, may vary.'||
           CHR(13)||
           CHR(13)||
           'Your participation in the campaign provides essential leadership at a decisive period for the '||
           'advancement of the School.  Thanks to your vote of confidence in Mines'||
           CHR(39)||
           's future, other supporters '||
           'will be encouraged to consider similar gift arrangements.  We deeply appreciate the '||
           'opportunity to honor and celebrate your dedication.'||
           CHR(13)||
           CHR(13)||
           'Your support for Mines and its students will ensure the School'||
           CHR(39)||
           's continued excellence for years '||
           'to come.  Thank you for your generosity.'
WHERE      ack_segment   IN ('Bequest Ex')
   AND     signer        = 'VP';
COMMIT;
/
/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Bequest'
 WHERE     signer        = 'VP'
   AND     ack_segment   = 'Bequest Ex'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;