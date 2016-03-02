/**********************/
/*** Bequest Letter ***/
/**********************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 
           'Dear EXECUTOR:'||
           CHR(13)||
           CHR(13)||
           'It is my privilege to acknowledge receipt of the bequest distribution of '||
           REPLACE(gift, '.00', '')||
           ' from the estate of '||
           RTRIM(pref_mail_name,' [D]')||
           '.  In accordance with the bequest provision, the distribution has been directed to the '||
           RTRIM(alloc_desc, ' ')||
           DECODE(society, ' ', '.'
                              ,'.  We are proud to recognize '||
                               salutation||
                               ' posthumously as a member of the '||
                               society||
                               ' Society.')||
           CHR(13)||
           CHR(13)||
           'Colorado School of Mines is honored to receive such bequests and grateful for the support '||
           'that they provide.  Estate gifts strengthen the School now and for the future, ensuring that '||
           'it will continue to provide a superior engineering and applied science education to some of the nation'||
           CHR(39)||
           's finest students.'||
           CHR(13)||
           CHR(13)||
           'We are deeply grateful to '||
           RTRIM(pref_mail_name,' [D]')||
           ' for '||
           bequest_hisher||
           ' commitment and thoughtful generosity. '
WHERE      ack_segment   IN ('Bequest')
   AND     ack_letter1   IS NULL;
COMMIT;
/