/************************/
/*** Memorial Letters ***/
/************************/
UPDATE    a_ack_rcpt_temp               m
   SET    m.ack_letter1_temp            =
   (SELECT 
   'I am writing to thank you for your kind donation of '||
   REPLACE(LTRIM(TO_CHAR(m.associated_amount_cfy,'$9,999,999.99')),'.00','')||
   'in memory of '||
   behalf_by||
   CHR(46)||
   '  As you requested, your contribution will be directed to the ' 
   RTRIM(m.alloc_desc)||
   '.  '||
   CHR(13)
   CHR(13)
   'Your gift is a thoughtful way to remember '||
   h.honor_pref_name||
   ', and your generosity will serve as a lasting tribute to '||
   DECODE(h.honor_gender_code, 'M', 'his'
                                  , 'her')||   
   ' life and accomplishments.  The '||
   h.honor_last||
   ' family will be notified that '||
   'you have made a contribution and I am sure it will be a great comfort knowing '||
   DECODE(h.honor_gender_code, 'M', 'he'
                                  , 'she')||
   ' is '||
   'remembered so warmly. '||
   CHR(13)||
   CHR(13)||
   'Thank you for your kindness. '||
    FROM   a_ack_temp_honor       h
   WHERE  h.receipt              = m.receipt)
   WHERE  m.ack_segment          = 'Honor'
     AND  m.transaction_type     IN ('GF','PP');
COMMIT;
/

/*************************************************************************/
/*** Indicate if no letter was generated for a Silver and Blue Segment ***/
/*************************************************************************/
UPDATE     a_ack_rcpt_temp
   SET     ack_letter1_temp   = 'No letter generated for Memorial Gift.'
 WHERE     ack_segment   = 'Honor'
   AND     ack_letter1_temp   IS NULL;
COMMIT;
/
EXIT;
