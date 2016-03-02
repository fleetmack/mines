/**************************************************/
/*** Campus PC Letter and Campus Regular Letter ***/
/**************************************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
       'It is with great pleasure that I take this opportunity to thank you for your generous gift to '||
       'Colorado School of Mines.  Contributions from faculty and staff convey a genuine sense '||
       'of pride in this institution and represent the loyalty and dedication that is evident within '||
       'the campus community.  '||
       DECODE(ack_segment, 'Campus PC', 'In recognition of your gift, I am pleased to welcome you to the '||
                          society||
                           ' Society of the 2005-2006 Mines President'||
                           CHR(39)||
                           's Council, a group of the '||
                           'School'||
                           CHR(39)||
                           's most generous and distinguished donors.',
                           ' ')||
CHR(13)||
CHR(13)||
       'As part of the '
        WHERE  (ack_segment           = 'Campus PC'
        OR ack_segment           = 'Campus Standard')
     AND  ack_letter1            IS NULL;
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     ack_letter2 = 'Transforming Resources'
    WHERE  (ack_segment           = 'Campus PC'
        OR ack_segment           = 'Campus Standard')
     AND  ack_letter2            IS NULL;
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     ack_letter3 = ' campaign, your contribution is an essential '||
       'component of our important efforts to continue to offer an education that is unique in '||
       'many ways.  Mines students are part of a learning experience that emphasizes problem '||
       'solving and hands-on training, as well as technical knowledge.  To maintain the resources '||
       'and technology necessary to provide such an education, the philanthropy of individual '||
       'donors is crucial.'||
CHR(13)||
CHR(13)||
       'Financial support from those who know the School best is perhaps the greatest '||
       'compliment to an institution.  Your gift directly affects the vitality of the School and '||
       'ensures that Mines continues to thrive.  We are grateful for your dedication.'
   WHERE  (ack_segment           = 'Campus PC'
        OR ack_segment           = 'Campus Standard')
     AND  ack_letter3            IS NULL;
COMMIT;
/

/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Campus Gift'
 WHERE     signer        = 'Pres'
   AND     (ack_segment  = 'Campus PC'
    OR      ack_segment  = 'Campus Standard')
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
