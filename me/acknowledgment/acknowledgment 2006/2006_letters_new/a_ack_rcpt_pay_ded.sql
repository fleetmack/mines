/*********************************************/
/*********************************************/
/*** Creates the Payroll Deduction Letters ***/
/*********************************************/
/*********************************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
   'Thank you for your recent pledge of '||
   REPLACE(pledge, '.00', '')||
   ' to '||
   RTRIM(alloc_desc,' ')||
   '.  Per your request, '||
   'your contribution will be deducted monthly from your paycheck in $'||
   pd_amount||
   ' installments '||
   'beginning in '||
   RTRIM(pd_start,' ')||
   '.  Following this schedule, your pledge will be fulfilled by '||
   RTRIM(pd_end,' ')||
   '.'||
   CHR(13)||
   CHR(13)||
   'The participation of our faculty and staff in '
    WHERE  ack_segment            IN ('Payroll Pledge')
     AND  signer                 = 'VP'
     AND  ack_letter1            IS NULL;
COMMIT;
/

UPDATE    a_ack_rcpt
   SET    ack_letter2 = 
   'Transforming Resources: The Campaign for Mines '
    WHERE  ack_segment            IN ('Payroll Pledge')
     AND  signer                 = 'VP'
     AND  ack_letter2            IS NULL;
COMMIT;
/

UPDATE    a_ack_rcpt
   SET     ack_letter3 = 
   'plays a vital role in meeting our goal of $125 million.  With the loyalty and '||
   'commitment of the Mines community to this important initiative, we can be sure our '||
   'exemplary institution continues to provide a premier education.'||
   CHR(13)||
   CHR(13)||
   'Again, thank you for your contribution.  The generosity of those closest to the School '||
   'helps to secure our place among the top institutions of engineering and applied sciences '||
   'worldwide.  We greatly appreciate your support.'
   WHERE  ack_segment            IN ('Payroll Pledge')
     AND  signer                 = 'VP'
     AND  ack_letter3            IS NULL;
COMMIT;
/


/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Payroll Deduction Pledge'
 WHERE     signer        = 'VP'
   AND     ack_segment   = 'Payroll Pledge'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
