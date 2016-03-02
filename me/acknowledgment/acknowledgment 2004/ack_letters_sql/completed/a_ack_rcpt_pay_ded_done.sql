/*********************************************/
/*********************************************/
/*** Creates the Payroll Deduction Letters ***/
/*********************************************/
/*********************************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
   'Thank you for your recent pledge of '||
   REPLACE(pledge, '.00', '')||
   ' to the '||
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
   'Gifts from faculty and staff are especially valued.  Your gift represents your pride in '||
   'Colorado School of Mines.  Without the dedication from loyal members of the campus '||
   'community, Mines could not fulfill its commitment to excellence.'||
   CHR(13)||
   CHR(13)
   'Your contribution also counts toward Transforming Resources'||
   CHR(58)||
   '  The Campaign For '||
   'Mines.  With a goal of $125 million, this campaign will ensure the futrue success of '||
   'Mines by increasing resources that will continually improve our academic programs, '||
   'facilities, and technologies.  Your generosity brings us closer to our goal.'||
   CHR(13)||
   CHR(13)||
   'Thank you for making Mines the best it can be.  We are fortunate to have the generous '||
   'participation of our faculty and staff.'
   WHERE  ack_segment            IN ('Payroll Pledge')
     AND  signer                 = 'VP'
     AND  ack_letter1            IS NULL;
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
