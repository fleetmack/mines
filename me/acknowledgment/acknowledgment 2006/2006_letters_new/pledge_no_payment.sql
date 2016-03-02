/*************************/
/*** PC Bequest Letter ***/
/*************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 
           'Dear EXECUTOR:'||
           CHR(13)||
           CHR(13)||
           'On behalf of the entire Colorado School of Mines community, I would like to gratefully '||
           'acknowledge the recent bequest from the estate of '||
           RTRIM(pref_mail_name,' [D]')||
           '.  '||
           initcap(bequest_hisher)||
           ' commitment to '||
           'the School is exemplary and greatly valued.'||
           CHR(13)||
           CHR(13)||
           'Bequests and other estate gifts are indicative of the loyalty and dedication that sustain the '||
           'quality of the School'||
           CHR(39)||
           's people and programs.  In addition to the financial support they '||
           'provide, such gifts constitute a powerful statement of gratitude for Mines'||
           CHR(39)||
           ' past and faith '||
           'in its future.'||
           CHR(13)||
           CHR(13)||
           'We are fortunate to be the beneficiaries of '||
           salutation||
           CHR(39)||
           's bequest.  '||
           initcap(bequest_hisher)||
           ' thoughtfulness and generosity are deeply appreciated.'
WHERE      ack_segment   IN ('PC Bequest')
   AND     ack_letter1   IS NULL;
COMMIT;
/

/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for PC Bequest'
 WHERE     signer        = 'Pres'
   AND     ack_segment   = 'PC Bequest'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
