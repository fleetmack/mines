/**************************************************/
/*** Campus PC Letter and Campus Regular Letter ***/
/**************************************************/
UPDATE    
   SET    ack_letter1_temp            =
        'It is my pleasure to thank you for your generous gift to Mines.  Your decision to support'||
        'the School financially, in addition to your professional contributions, signifies'||
        'extraordinary dedication.'||
    DECODE(m.ack_segment, 'Campus PC', 'In recognition of your gift, I welcome you to the '||
                           society||
                           'Society of the 2002-2003 Mines President'||
                           CHR(39)||
                           's Council, a select group of the'||
                           'School'||
                           CHR(39)||
                           's most generous donors.')||
CHR(13)
CHR(13)
'As you well know, the SChool requires private support to maintain and build on the'||
'quality of our academic programs and facilities.  Gifts like yours play a critical role in'||
'sustaining the margin of excellence for which Colorado School of Mines is known.'||
CHR(13)
CHR(13)
'The most direct beneficiaries of your generosity are our students.  As these young men'||
'and women pursue careers in critical industries, their achievements affect all aspects of'||
'our lives and those of future generations.'||
CHR(13)
CHR(13)
    DECODE(m.ack_segment, 'Campus PC',
    'It is particularly heartening when faculty and staff make Mines one of their philanthropic'||
    'priorities.')||
'Thank you again for your exceptional commitment to Mines'||
   WHERE  ack_segment            IN ('Campus PC', 'Campus Standard')
     AND  ack_letter1_temp            IS NULL;
COMMIT;
/
