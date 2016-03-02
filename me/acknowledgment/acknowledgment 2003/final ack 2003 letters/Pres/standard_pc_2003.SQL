/**************************/
/*** Standard PC Letter ***/
/**************************/
UPDATE    
   SET    ack_letter1_temp            =
'I am writing to express my '||
DECODE(ack_segment,'Gugg','gratitude ',
                          'appreciation ')||
'for your'||
DECODE(ack_segment,'Gugg','gift ',
                          'generous gift ')||
'to Colorado School of '||
'Mines.  '||
DECODE(ack_segment,
    'Gugg',     'Your generosity is an inspiration to the entire Mines community.  In honor of'||
                'your gift, I have the pleasure of welcoming you to the '||
                society||'Society of the'||
                '2002-2003 Mines President'||
                CHR(39)||
                's Council, a highly select group of the School'||
                's most'||
                'dedicated supporters.  I hope to have the opportunity to thank you personally in the near '||
                'future.',
     'Parent PC','It is particularly heartening when we receive such gifts from parents of students '||
                 'and alumni.  In recognition of your contribution, I welcome you to the '||
                 society||
                 ' Society of the 2002-2003 Mines President'||
                 CHR(39)||
                 's Council, a select group of the '||
                 'School'||
                 CHR(39)||
                 's most generous donors.',
      'Your support plays an important role in helping the School sustain the excellence '||
      'for which it is known.  In recognition of your gift, I welcome you to the '||
      society||
      ' Society of the 2002-2003 Mines President'||
      CHR(39)||
      's Council, a select group of the '||
      'School'||
      CHR(39)||
      's most generous donors.'||)
CHR(13)
CHR(13)
'During my 27 years at Mines, I have developed a profound belief in the significance of '||
'the School'||
CHR(39)||
's mission to the welfare of the nation and the world.  Year after year, '||
'corporations and experienced professionals praise the ability of our graduates to '||
'undertake the practical and important work demanded of them.  The School was founded '||
'to provide hands-on training'||
CHR(151)||
'an education that works'||
CHR(151)||
'and this focus continues to be at'||
'the heart of the education we provide.'||
CHR(13)
CHR(13)
'This applied education requires considerable infrastructure, and with today'||
CHR(39)||
's rapid pace'||
'of technological development, staying up to date is more costly than ever.  However, with '||
'the extraordinary support of people like you, the School remains on the forefront of such '||
'developments and continues to deliver a preeminent education in engineering and the '||
'applied sciences.'||
CHR(13)
CHR(13)
'The most direct beneficiaries of your generosity are the intelligent and motivated students '||
'attending Mines'||
    DECODE(ack_segment, 'Parent PC', ' with your child.  '
    '.  ')||
'As these young men and women pursue careers in critical industries, '||
'their achievements affect all aspects of our lives and those of future generations.'||
CHR(13)
CHR(13)
    DECODE(ack_segment, 'Gugg', 'Once again, thank you for supporting the School and making the valuable work we do '||
                                'possible.  I value your commitment to Mines.',

                                'Thank you again for your commitment to Mines.')||


    WHERE  ack_segment            IN ('Gugg','Parent PC', 'Campus PC','PC', 'Memorial PC', 'Pledge Payment PC')
     AND  ack_letter1_temp            IS NULL;
COMMIT;
/
