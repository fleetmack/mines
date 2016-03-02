/**************************/
/*** Athletic PC Letter ***/
/**************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
   'Thank you for your generous '||
   LOWER(transaction_type_desc)||
   ' to the Colorado School of Mines Athletic Department.'||
   '  In addition to your Silver and Blue membership, it is my pleasure to extend you a warm'||
   ' welcome to the '||
   society||
   ' Society of the Mines 2003-2004 President'||
   CHR(39)||
   's Council.'||
   '  Your contribution places you in a select group of the School'||
   CHR(39)||
   's most dedicated donors.'
   CHR(13)||
   CHR(13)||
   'Team sports enhance learning and enable students to meet goals outside the classroom.'||
   '  They foster teamword, discipline, and involvement in campus life.  We believe that'||
   ' athletics are a large part of the Mines education'||
   CHR(59)||
   ' providing the opportunity for students to'||
   ' participate in sports is a key priority.  Your support allows us to maintain an important'||
   ' aspect of the college experience.'||
   CHR(13)||
   CHR(13)||
   'Again, thank you for supporting Mines'||
   CHR(39)||
   ' athletics program.  Your generosity ensures the'||
   ' continued development and success of our student-athletes.'
    WHERE  ack_segment            IN ('Athletic PC')
     AND  ack_letter1            IS NULL;
COMMIT;
/
/**********************************************************************/
/*** Indicate if no letter was generated for a PC President Segment ***/
/**********************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for Athletic PC'
 WHERE     signer        = 'Pres'
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
