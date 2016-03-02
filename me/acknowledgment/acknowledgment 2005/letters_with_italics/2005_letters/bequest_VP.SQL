/**********************/
/*** Bequest Letter ***/
/**********************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 
           'Dear EXECUTOR:'||
           CHR(13)||
           CHR(13)||
           'It is my pleasure to acknowledge the receipt of the bequest distribution of '||
           REPLACE(gift, '.00', '')||
           ' from '||
           'the estate of '||
           RTRIM(pref_mail_name,' [D]')||
           '.  In accordance with the bequest provision, the distribution '||
           'has been directed towards the '||
           RTRIM(alloc_desc, ' ')||
           DECODE(society, ' ', '.'
                              ,'.  We are very fortunate to be the recipients of such a '||
                              'special gift arrangement and posthumously recognize '||
                               salutation||
                               ' as a member '||
                               'of the '||
                               society||
                               ' Society of the Colorado School of Mines 2004-2005 President'||
                               CHR(39)||
                               's '||
                               'Council.')||
           CHR(13)||
           CHR(13)||
           salutation||
           CHR(39)||
           's generosity is truly notable.  '||
           initcap(bequest_hisher)||
           ' bequest is an exceptionally '||
           'meaningful way to demonstrate loyalty and dedication to the School.  We are honored to '||
           'include '||
           bequest_himher||
           ' among our friends.'
WHERE      ack_segment   IN ('Bequest')
   AND     signer        = 'VP'
   AND     ack_letter1   IS NULL;
COMMIT;
/
/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Bequest'
 WHERE     signer        = 'VP'
   AND     ack_segment   = 'Bequest'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;