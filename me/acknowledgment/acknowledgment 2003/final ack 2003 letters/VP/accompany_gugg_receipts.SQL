/*****************************/
/***Accompany Gugg Receipts***/
/*****************************/
UPDATE    
   SET    ack_letter1_temp            =
'Thank you for your generous donation to Colorado School of Mines.  While we are '||
'sending you the enclosed receipt for tax purposes, I wanted to take the opportunity to '||
'personally express my appreciation for your gift.'||
CHR(13)
CHR(13)
'Colorado School of Mines is privileged to have your support.  There are few individuals '||
'able to give at this level and we are fortunate to include you among our most valued '||
'benefactors.  In the years to come, as the School continues to build upon its proud legacy, '||
'I hope you will take satisfaction in Mines'||
CHR(39)||
' success, knowing you have done much to help '||
'secure our future.'
      WHERE  ack_segment            IN ('Gugg')
     AND  ack_letter1_temp            IS NULL;
COMMIT;
/


