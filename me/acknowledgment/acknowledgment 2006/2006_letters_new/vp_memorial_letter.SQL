/************************/
/*** Memorial Letters ***/
/************************/
UPDATE    a_ack_rcpt      m        
   SET    m.ack_letter1          =
   (SELECT 
   'It is my privilege to thank you for your contribution of '||
     REPLACE(LTRIM(TO_CHAR(m.associated_amount_cfy,'$9,999,999.99')),'.00','')||
   ' to Colorado '||
   'School of Mines in memory of '||
   h.honor_pref_name||
   CHR(46)||
   '  In accordance with your request, your donation will be '||
   'directed to the '||
   RTRIM(m.alloc_desc)||
   '.  '||
   CHR(13)||
   CHR(13)||
   'Your gift serves as a particularly thoughtful tribute to '||
   h.honor_salutation||
   CHR(39)||
   's memory.  '||
   'The '||
   h.honor_last||
   ' family will be '||
   'notified of your contribution.  I am sure that your kindness will be deeply appreciated.'||
   CHR(13)||
   CHR(13)||
   'Thank you again for your generous remembrance.'
    FROM   a_ack_temp_honor       h
   WHERE  h.receipt              = m.receipt)
   WHERE  m.ack_segment          = 'Honor'
     AND  m.transaction_type     IN ('GF','PP');
COMMIT;
/

/*************************************************************************/
/*** Indicate if no letter was generated for a Silver and Blue Segment ***/
/*************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Memorial Gift.'
 WHERE     ack_segment   = 'Honor'
   AND     ack_letter1   IS NULL;
COMMIT;
/
EXIT;
