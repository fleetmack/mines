/**************************/
/*** Memorial PC Letter ***/
/**************************/
UPDATE    a_ack_rcpt      m        
   SET    m.ack_letter1          =
   (SELECT 
   'Thank you for your generous gift to Colorado School of Mines in memory of '||
   h.honor_pref_name||
   '.  Your thoughtfulness honors the memory of '||
   h.honor_salutation||
   ' by supporting an '||
   'institution that played such an important role in '||
   m.bequest_hisher||
   ' life.'||
   CHR(13)||
   CHR(13)||
   'In recognition of your gift, I welcome you to the '||
   society||
   ' Society of the Mines '||
   '2003-2004 President'||
   CHR(39)||
   's Council, a select group of the School'||
   CHR(39)||
   's most dedicated donors.'||
   CHR(13)||
   CHR(13)||
   'Donations such as this are essential to sustaining the School'||
   CHR(39)||
   's excellence.  With the '||
   'kindness of private support, Mines is able to remain an engineering and applied science '||
   'institution of the highest quality.'||
   CHR(13)||
   CHR(13)||
   'Again, thank you for your memorial gift and your support of Mines.'
    FROM   a_ack_temp_honor       h
   WHERE  h.receipt              = m.receipt)
   WHERE  m.ack_segment          = 'Memorial PC'
     AND  m.transaction_type     IN ('GF','PP');
COMMIT;
/

/*************************************************************************/
/*** Indicate if no letter was generated for a Silver and Blue Segment ***/
/*************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Memorial Gift.'
 WHERE     ack_segment   = 'Memorial PC'
   AND     ack_letter1   IS NULL;
COMMIT;
/
EXIT;
