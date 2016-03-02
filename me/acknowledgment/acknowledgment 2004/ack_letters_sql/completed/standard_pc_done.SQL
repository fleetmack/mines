/**************************/
/*** Standard PC Letter ***/
/**************************/
UPDATE    a_ack_rcpt
   SET    ack_letter1            =
DECODE(ack_segment,'Gugg','I would personally like to t',
                          'T')||
'hank you for your generous gift to Colorado School of Mines.'||

DECODE(flag_committee, 'Reun', '  Your service on the 2003-2004 Reunion Giving Program Committee and your '||
                               'financial gift play an important role in helping the School sustain the excellence for '||
                               'which it is known.  In recognition of your financial gift, I welcome you to the '||
                               society||
                               ' Society of the 2002-2003 Mines President'||
                               CHR(39)||
                               's Council.',
                        'PC',   '  Your service on the '||
                                committee_region||
                                ' Regional President'||
                                CHR(39)||
                                's Council '||
                                'Committee and your financial gift play an important role in helping the School sustain the '||
                                'excellence for which it is known.  In recognition of your financial gift, I welcome you to the '||
                                society||
                                ' Society of the 2002-2003 Mines President'||
                                CHR(39)||
                                's Council.',
                        'Both', '  You are among a very special group of individuals who '||
                                'support the School with both their financial resources and their time.  I thank you for '||
                                'your financial contribution and your service on the '||
                                committee_region||
                                ' Regional President'||
                                CHR(39)||
                                's Council '||
                                'Committee and Reunion Giving Committee.  These expressions of dedication to the '||
                                'School play an important role in helping Mines sustain the excellence for which it is '||
                                'known.  In recognition of your financial gift, I welcome you to the '||
                                society||
                                ' Society '||
                                'of the 2003-2004 Mines President'||
                                CHR(39)||
                                's Council.',
                                '  ')||
'In recognition of your'||
DECODE(ack_segment,
    'Gugg',     ' remarkable contribution, it is my honor and pleasure to welcome '||
                'you to the '||
                society||
                ' Society of the 2003-2004 Mines President'||
                CHR(39)||
                's Council.  You '||
                'are part of a highly select group of the School'||
                CHR(39)||
                's most vital and dedicated donors.  I hope '||
                'to have an opportunity to thank you personally in the near future.'||,
    'Parent PC',' contribution, it is my pleasure to welcome you to the '||
                 society||
                 ' Society of the 2003-'||
                 '2004 Mines President'||
                 CHR(39)||
                 's Council, a select group of the School'||
                 CHR(39)||
                 's most dedicated donors.'||
                 '  We deeply appreciate your gift in addition to the investment of sending your '||
                 'CHILD/CHILDREN to Mines.',
    /***Otherwise - meaning - for Parent PC or PC***/
                 ' contribution, it is my pleasure to welcome you to the'||
                 society||
                 ' Society of the '||
                 '2003-2004 Mines President'||
                 CHR(39)||
                 's Council, a select group of the School'||
                 CHR(39)||
                 's most dedicated donors.')||
CHR(13)||
CHR(13)||
'Mines is distinguished by its ability to deliver a learning experience that emphasizes '||
'problem-solving, technical knowledge, and hands-on-training.  These essential '||
'components of our academic environment are crucial to our overall mission to discover, '||
'transform, and sustain the resources that fuel prosperity.  Upon leaving Mines, our '||
'graduates are well equipped to carry this mission with them into the ever-changing global '||
'marketplace.'||
CHR(13)||
CHR(13)||
'Today, as our standard of living continues to rise, demand for the capabilities of an '||
'institution like Mines rises as well.  Your support helps us address this demand with '||
'confidence.'||
CHR(13)||
CHR(13)||
    DECODE(ack_segment, 'Gugg', 'On behalf of the entire campus community, thank you again for your exceptional '||
                                'commitment to Mines and its mission.  The dedication of generous donors like you will '||
                                'ensure the success of Mines for years to come.',
                   'Parent PC', 'Thank you again for supporting your CHILD/CHILDREN education.  The '||
                                'commitment of parents like you helps ensure the success of Mines for years to come.',
  /***OthwerwisePC and PP PC***/'Again, thank you for your commitment to Mines and its mission.  The dedication of '||
                                'donors like you will ensure the success of the School for years to come.'||)
    WHERE  ack_segment            IN ('Gugg','Parent PC', 'PC', 'Memorial PC', 'Pledge Payment PC')
     AND  signer                 = 'Pres'
     AND  ack_letter1            IS NULL;
COMMIT;
/
/***************************************************************************/
/*** Indicate if no letter was generated for a Payroll Deduction Segment ***/
/***************************************************************************/
UPDATE     a_ack_rcpt
   SET     ack_letter1   = 'No letter generated for PC Gift'
 WHERE     signer        = 'Pres'
   AND     ack_segment   IN ('Gugg','Parent PC','PC','Pledge Payment PC')
   AND     ack_letter1   IS NULL;
COMMIT;
/

EXIT;
