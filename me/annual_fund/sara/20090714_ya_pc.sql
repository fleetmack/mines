/***
Here is what I was thinking for the criteria:
�       Gave at YAPC level in FY09 with gift designation
�       FY08 gift amount
�       Lifetime giving total
�       Any committee participation with foundation or CSMAA
�       City, State
�       Business Info (Name of company and position)
�       Degree(s) and Grad Year
***/

SELECT id_number, pref_mail_name, pref_name_sort, pref_class_year
   FROM entity
 WHERE record_type_code = 'AL'
     AND pref_class_year BETWEEN '2001' and '2009'
     AND id_number IN
            (SELECT id_number FROM a_dw_gift_clubs WHERE pc09 = '1')
ORDER BY pref_name_sort