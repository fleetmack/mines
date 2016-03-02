/**************************************************/
/*** Campus PC Letter and Campus Regular Letter ***/
/**************************************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
        'I would like to personally thank you for your generous contribution to Colorado School'||
        ' of Mines.  Such financial commitment from dedicated professionals is one of the primary'||
        ' reasons the School remains a prominent institution of higher learning.  '||
    DECODE(ack_segment, 'Campus PC', 'In recognition of '||
                           'your gift, it is my pleasure to welcome you to the '||
                           society||
                           ' Society of the Mines '||
                           'President'||
                           CHR(39)||
                           's Council for 2003-2004, a group of the School'||
                           CHR(39)||
                           's most generous and vital '||
                           'donors.')||
CHR(13)||
CHR(13)||
'It is private support that is able to sustain the high quality education for which we are'||
' known.  Your gift playes a significant role in strengthening and building our academic'||
' programs, in maintaining and constructing campus facilities, and in providing'||
' opportunities for deserving students.'||
CHR(13)||
CHR(13)||
'Contributions from faculty and staff directly impact the success of our students, who, in'||
' turn, significantly contribute to the welfare of our community, our region, and our world.'||
'  Your kindness signifies your dedication to the standard of life Mines seeks to uphold.'||
CHR(13)||
CHR(13)||
'Thank you again for your loyalty and support.'
   WHERE  (ack_segment           = 'Campus PC'
        OR ack_segment           = 'Campus Standard')
     AND  ack_letter1            IS NULL;
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
