CREATE OR REPLACE FUNCTION    ADVANCE.CONVERT_BANNER_COUNTRY_NAME
(country_desc IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_country VARCHAR2(35);
BEGIN
IF country_desc = 'Great Britain & N Ireland' THEN hold_country := 'UK';
ELSIF country_desc = 	'Afghanistan'	THEN hold_country :=	'AF';
ELSIF country_desc = 	'Azerbaijan'	THEN hold_country :=	'AZER';
ELSIF country_desc = 	'Angola'	THEN hold_country :=	'AO';
ELSIF country_desc = 	'Australia'	THEN hold_country :=	'AU';
ELSIF country_desc = 	'Austria'	THEN hold_country :=	'AI';
ELSIF country_desc = 	'Botswana'	THEN hold_country :=	'BT';
ELSIF country_desc = 	'Belgium'	THEN hold_country :=	'BL';
ELSIF country_desc = 	'Bangladesh'	THEN hold_country :=	'BG';
ELSIF country_desc = 	'Bolivia'	THEN hold_country :=	'BO';
ELSIF country_desc = 	'Burma'	THEN hold_country :=	'BM';
ELSIF country_desc = 	'Brazil'	THEN hold_country :=	'BZ';
ELSIF country_desc = 	'Bulgaria'	THEN hold_country :=	'BUL';
ELSIF country_desc = 	'Canada'	THEN hold_country :=	'CD';
ELSIF country_desc = 	'China'	THEN hold_country :=	'CH';
ELSIF country_desc = 	'Chile'	THEN hold_country :=	'CL';
ELSIF country_desc = 	'Cameroon'	THEN hold_country :=	'CA';
ELSIF country_desc = 	'Colombia'	THEN hold_country :=	'CM';
ELSIF country_desc = 	'France'	THEN hold_country :=	'FR';
ELSIF country_desc = 	'Gabon'	THEN hold_country :=	'GA';
ELSIF country_desc = 	'Ghana'	THEN hold_country :=	'GH';
ELSIF country_desc = 	'Germany'	THEN hold_country :=	'GE';
ELSIF country_desc = 	'Greece'	THEN hold_country :=	'GR';
ELSIF country_desc = 	'Indonesia'	THEN hold_country :=	'IO';
ELSIF country_desc = 	'India'	THEN hold_country :=	'II';
ELSIF country_desc = 	'Iran'	THEN hold_country :=	'IR';
ELSIF country_desc = 	'Israel'	THEN hold_country :=	'IS';
ELSIF country_desc = 	'Italy'	THEN hold_country :=	'IT';
ELSIF country_desc = 	'Iraq'	THEN hold_country :=	'IQ';
ELSIF country_desc = 	'Japan'	THEN hold_country :=	'JA';
ELSIF country_desc = 	'Jordan'	THEN hold_country :=	'JO';
ELSIF country_desc = 	'Kenya'	THEN hold_country :=	'KE';
ELSIF country_desc = 	'South Korea'	THEN hold_country :=	'KO';
ELSIF country_desc = 	'Kuwait'	THEN hold_country :=	'KU';
ELSIF country_desc = 	'Kazakhstan'	THEN hold_country :=	'KAZ';
ELSIF country_desc = 	'Lebanon'	THEN hold_country :=	'LE';
ELSIF country_desc = 	'Libya'	THEN hold_country :=	'LY';
ELSIF country_desc = 	'Mongolia'	THEN hold_country :=	'MON';
ELSIF country_desc = 	'Oman'	THEN hold_country :=	'OM';
ELSIF country_desc = 	'Mexico'	THEN hold_country :=	'MX';
ELSIF country_desc = 	'Malaysia'	THEN hold_country :=	'MY';
ELSIF country_desc = 	'Nigeria'	THEN hold_country :=	'NI';
ELSIF country_desc = 	'Netherlands'	THEN hold_country :=	'NL';
ELSIF country_desc = 	'Nepal'	THEN hold_country :=	'NEP';
ELSIF country_desc = 	'New Zealand'	THEN hold_country :=	'NZ';
ELSIF country_desc = 	'Peru'	THEN hold_country :=	'PU';
ELSIF country_desc = 	'Pakistan'	THEN hold_country :=	'PK';
ELSIF country_desc = 	'Poland'	THEN hold_country :=	'PL';
ELSIF country_desc = 	'Qatar'	THEN hold_country :=	'QA';
ELSIF country_desc = 	'Russia'	THEN hold_country :=	'RU';
ELSIF country_desc = 	'Saudi Arabia'	THEN hold_country :=	'SB';
ELSIF country_desc = 	'South Africa'	THEN hold_country :=	'SA';
ELSIF country_desc = 	'Spain'	THEN hold_country :=	'SP';
ELSIF country_desc = 	'Sweden'	THEN hold_country :=	'SW';
ELSIF country_desc = 	'Switzerland'	THEN hold_country :=	'SZ';
ELSIF country_desc = 	'United Arab Emirates'	THEN hold_country :=	'UA';
ELSIF country_desc = 	'Trinidad And Tobago'	THEN hold_country :=	'TD';
ELSIF country_desc = 	'Thailand'	THEN hold_country :=	'TH';
ELSIF country_desc = 	'Togo'	THEN hold_country :=	'TO';
ELSIF country_desc = 	'Tunisia'	THEN hold_country :=	'TU';
ELSIF country_desc = 	'Turkey'	THEN hold_country :=	'TR';
ELSIF country_desc = 	'Taiwan'	THEN hold_country :=	'TW';
ELSIF country_desc = 	'United Kingdom (1s)'	THEN hold_country :=	'UK';
ELSIF country_desc = 	'Venezuela'	THEN hold_country :=	'VE';
ELSIF country_desc = 	'Vietnam'	THEN hold_country :=	'VN';
ELSIF country_desc = 	'Zambia'	THEN hold_country :=	'ZM';
ELSIF country_desc = 	'US'	THEN hold_country :=	'USA';
END IF;
RETURN hold_country;
END;