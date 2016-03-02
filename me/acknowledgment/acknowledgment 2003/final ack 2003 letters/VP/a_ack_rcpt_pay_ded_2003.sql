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
   '.  As you requested, your contribution will be deducted monthly from your paychecks in $'||
   pd_amount||
   ' installments beginning in '||
   RTRIM(pd_start,' ')||
   '.  According to this schedule, your pledge will be satisfied by '||
   RTRIM(pd_end,' ')||
   '.'||
   CHR(13)||
   CHR(13)||
   'As you know, every gift Mines receives is significant to our mission, students, and programs'||
   CHR(151)||
   'but gifts from within our own community hold special value.  Your support directly impacts our '||
   'professional environment.  It is most rewarding to work in an atmosphere where so many of our colleagues '||
   'reinforce the pride they feel in what they do.  Professionally, you play an active role in our success, '||
   'and your gift illustrates your commitment to our mission on a personal level as well.'||
   CHR(13)||
   CHR(13)||
   'By participating in the Campus Campaign you maximize the efforts of our faculty and staff to ensure '||
   'we can maintain our world-renowned prominence in higher education.  And with your significant gift, you also '||
   DECODE(pc_pfy, 0, 'become a valued member of '
                , 1, 'renew your valued membership in the ')||
   society||
   ' Society of the Colorado School of Mines President'||
   CHR(39)||
   's Council for 2001-2002.'||
   CHR(13)||
   CHR(13)||
   'We are grateful for your support and fortunate for your involvement in our community.  I extend '||
   'you special thanks for your contributions of all kinds to the School.'
   WHERE  ack_segment            IN ('Payroll Pledge')
     AND  signer                 = 'VP'
     AND  ack_letter1            IS NULL
     AND  (cfy_commitment        >= 1000
      OR  id_number              IN
      (SELECT a.id_number
         FROM a_ack_rcpt         a,
              a_dw_young_alum    y
        WHERE a.record_type_code = 'AL'
          AND a.cfy_commitment   BETWEEN y.pc_gift_level AND y.pc_gift_level_top
          AND a.pref_class_year  = y.year));
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
