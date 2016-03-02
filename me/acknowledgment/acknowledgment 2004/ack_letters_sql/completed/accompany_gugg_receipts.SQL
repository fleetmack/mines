/*****************************/
/***Accompany Gugg Receipts***/
/*****************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
'Thank you for your generous pledge to Colorado School of Mines.  We are sending the '||
'enclosed pledge statement for your records.'||
CHR(13)||
CHR(13)||
'I wanted to take a moment to thank you for such a significant commitment.  With the '||
'kindness of private support, Mines is able to remain an engineering and applied science '||
'institution of the highest quality.  For your convenience, you will receive periodic '||
'reminders of our fiscal year end, June 30, 2004.'||
CHR(13)||
CHR(13)||
'On behalf fo the entire campus community, thank you for your dedication to Mines.'
      WHERE  ack_segment            IN ('Accompany')
     AND  signer                 = 'VP Gugg'
     AND  ack_letter1            IS NULL;
COMMIT;
/

/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for PC/Gugg Pledge Accompany VP Letter'
 WHERE     ack_segment   = 'Accompany'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
