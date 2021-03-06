CREATE OR REPLACE FUNCTION          ADVANCE.CONVERT_BANNER_SPORT
(sport_desc IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_sport VARCHAR2(4);
BEGIN
IF    sport_desc = 	'WRESTLNG'	            THEN hold_sport :=	'WR';
ELSIF sport_desc =  'VOLYBALL'              THEN hold_sport :=  'VB';
ELSIF sport_desc =  'SOFTBALL'              THEN hold_sport :=  'SB';
ELSIF sport_desc =  'GOLF'                  THEN hold_sport :=  'GOLF';
ELSIF sport_desc =  'FOOTBALL'              THEN hold_sport :=  'FB';
ELSIF sport_desc =  'BASEBALL'              THEN hold_sport :=  'BB';
ELSIF sport_desc IN ('MTRACK','WTRACK')	    THEN hold_sport :=	'TF';
ELSIF sport_desc IN ('MSWIM','WSWIM')	    THEN hold_sport :=	'SWIM';
ELSIF sport_desc IN ('MSOCCER','WSOCCER')	THEN hold_sport :=	'SOC';
ELSIF sport_desc IN ('MCROSS','WCROSS')     THEN hold_sport :=	'CC';
ELSIF sport_desc IN ('WBKTBALL','MBKTBALL')	THEN hold_sport :=	'BKB';
END IF;
RETURN hold_sport;
END;