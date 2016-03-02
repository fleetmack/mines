select r.id_number, 
       e.person_or_org,
       e.record_status_code,
       replace(e.pref_mail_name,','),
       
       (select max(decode(r2.xsequence,1,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat1_type,
        (select max(decode(r2.xsequence,1,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat1_desc,
        (select max(decode(r2.xsequence,1,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat1_id,
        (select max(decode(r2.xsequence,1,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat1_name,
           
           
          (select max(decode(r2.xsequence,2,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat2_type,
        (select max(decode(r2.xsequence,2,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat2_desc,
        (select max(decode(r2.xsequence,2,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat2_id,
        (select max(decode(r2.xsequence,2,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat2_name,
           
           
                  (select max(decode(r2.xsequence,3,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat3_type,
        (select max(decode(r2.xsequence,3,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat3_desc,
        (select max(decode(r2.xsequence,3,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat3_id,
        (select max(decode(r2.xsequence,3,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat3_name,
         
                         (select max(decode(r2.xsequence,4,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat4_type,
        (select max(decode(r2.xsequence,4,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat4_desc,
        (select max(decode(r2.xsequence,4,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat4_id,
        (select max(decode(r2.xsequence,4,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat4_name,
           
                             (select max(decode(r2.xsequence,5,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat5_type,
        (select max(decode(r2.xsequence,5,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat5_desc,
        (select max(decode(r2.xsequence,5,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat5_id,
        (select max(decode(r2.xsequence,5,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat5_name,
           
                             (select max(decode(r2.xsequence,6,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat6_type,
        (select max(decode(r2.xsequence,6,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat6_desc,
        (select max(decode(r2.xsequence,6,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat6_id,
        (select max(decode(r2.xsequence,6,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat6_name,
           
                             (select max(decode(r2.xsequence,7,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat7_type,
        (select max(decode(r2.xsequence,7,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat7_desc,
        (select max(decode(r2.xsequence,7,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat7_id,
        (select max(decode(r2.xsequence,7,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat7_name,
           
                             (select max(decode(r2.xsequence,8,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat8_type,
        (select max(decode(r2.xsequence,8,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat8_desc,
        (select max(decode(r2.xsequence,8,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat8_id,
        (select max(decode(r2.xsequence,8,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat8_name,
           
                             (select max(decode(r2.xsequence,9,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat9_type,
        (select max(decode(r2.xsequence,9,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat9_desc,
        (select max(decode(r2.xsequence,9,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat9_id,
        (select max(decode(r2.xsequence,9,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat9_name,
           
                             (select max(decode(r2.xsequence,10,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat10_type,
        (select max(decode(r2.xsequence,10,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat10_desc,
        (select max(decode(r2.xsequence,10,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat10_id,
        (select max(decode(r2.xsequence,10,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat10_name,
           
                             (select max(decode(r2.xsequence,11,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat11_type,
        (select max(decode(r2.xsequence,11,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat11_desc,
        (select max(decode(r2.xsequence,11,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat11_id,
        (select max(decode(r2.xsequence,11,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat11_name,
           
                             (select max(decode(r2.xsequence,12,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat12_type,
        (select max(decode(r2.xsequence,12,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat12_desc,
        (select max(decode(r2.xsequence,12,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat12_id,
        (select max(decode(r2.xsequence,12,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat12_name,
           
                             (select max(decode(r2.xsequence,13,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat13_type,
        (select max(decode(r2.xsequence,13,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat13_desc,
        (select max(decode(r2.xsequence,13,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat13_id,
        (select max(decode(r2.xsequence,13,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat13_name,
           
                             (select max(decode(r2.xsequence,14,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat14_type,
        (select max(decode(r2.xsequence,14,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat14_desc,
        (select max(decode(r2.xsequence,14,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat14_id,
        (select max(decode(r2.xsequence,14,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat14_name,
           
                             (select max(decode(r2.xsequence,15,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat15_type,
        (select max(decode(r2.xsequence,15,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat15_desc,
        (select max(decode(r2.xsequence,15,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat15_id,
        (select max(decode(r2.xsequence,15,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat15_name,
           
                             (select max(decode(r2.xsequence,16,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat16_type,
        (select max(decode(r2.xsequence,16,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat16_desc,
        (select max(decode(r2.xsequence,16,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat16_id,
        (select max(decode(r2.xsequence,16,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat16_name,
           
                             (select max(decode(r2.xsequence,17,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat17_type,
        (select max(decode(r2.xsequence,17,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat17_desc,
        (select max(decode(r2.xsequence,17,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat17_id,
        (select max(decode(r2.xsequence,17,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat17_name,
           
                             (select max(decode(r2.xsequence,18,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat18_type,
        (select max(decode(r2.xsequence,18,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat18_desc,
        (select max(decode(r2.xsequence,18,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat18_id,
        (select max(decode(r2.xsequence,18,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat18_name,
           
                             (select max(decode(r2.xsequence,19,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat19_type,
        (select max(decode(r2.xsequence,19,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat19_desc,
        (select max(decode(r2.xsequence,19,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat19_id,
        (select max(decode(r2.xsequence,19,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat19_name,
           
                             (select max(decode(r2.xsequence,20,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat20_type,
        (select max(decode(r2.xsequence,20,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat20_desc,
        (select max(decode(r2.xsequence,20,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat20_id,
        (select max(decode(r2.xsequence,20,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat20_name,
           
                             (select max(decode(r2.xsequence,21,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat21_type,
        (select max(decode(r2.xsequence,21,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat21_desc,
        (select max(decode(r2.xsequence,21,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat21_id,
        (select max(decode(r2.xsequence,21,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat21_name,
           
                             (select max(decode(r2.xsequence,22,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat22_type,
        (select max(decode(r2.xsequence,22,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat22_desc,
        (select max(decode(r2.xsequence,22,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat22_id,
        (select max(decode(r2.xsequence,22,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat22_name,
           
                             (select max(decode(r2.xsequence,23,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat23_type,
        (select max(decode(r2.xsequence,23,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat23_desc,
        (select max(decode(r2.xsequence,23,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat23_id,
        (select max(decode(r2.xsequence,23,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat23_name,
           
                             (select max(decode(r2.xsequence,24,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat24_type,
        (select max(decode(r2.xsequence,24,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat24_desc,
        (select max(decode(r2.xsequence,24,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat24_id,
        (select max(decode(r2.xsequence,24,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat24_name,
           
                             (select max(decode(r2.xsequence,25,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat25_type,
        (select max(decode(r2.xsequence,25,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat25_desc,
        (select max(decode(r2.xsequence,25,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat25_id,
        (select max(decode(r2.xsequence,25,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat25_name,
           
                             (select max(decode(r2.xsequence,26,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat26_type,
        (select max(decode(r2.xsequence,26,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat26_desc,
        (select max(decode(r2.xsequence,26,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat26_id,
        (select max(decode(r2.xsequence,26,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat26_name,
           
                             (select max(decode(r2.xsequence,27,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat27_type,
        (select max(decode(r2.xsequence,27,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat27_desc,
        (select max(decode(r2.xsequence,27,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat27_id,
        (select max(decode(r2.xsequence,27,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat27_name,
           
                             (select max(decode(r2.xsequence,28,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat28_type,
        (select max(decode(r2.xsequence,28,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat28_desc,
        (select max(decode(r2.xsequence,28,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat28_id,
        (select max(decode(r2.xsequence,28,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat28_name,
           
                             (select max(decode(r2.xsequence,29,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat29_type,
        (select max(decode(r2.xsequence,29,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat29_desc,
        (select max(decode(r2.xsequence,29,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat29_id,
        (select max(decode(r2.xsequence,29,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat29_name,
           
                             (select max(decode(r2.xsequence,30,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat30_type,
        (select max(decode(r2.xsequence,30,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat30_desc,
        (select max(decode(r2.xsequence,30,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat30_id,
        (select max(decode(r2.xsequence,30,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat30_name,
           
                             (select max(decode(r2.xsequence,31,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat31_type,
        (select max(decode(r2.xsequence,31,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat31_desc,
        (select max(decode(r2.xsequence,31,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat31_id,
        (select max(decode(r2.xsequence,31,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat31_name,
           
                             (select max(decode(r2.xsequence,32,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat32_type,
        (select max(decode(r2.xsequence,32,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat32_desc,
        (select max(decode(r2.xsequence,32,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat32_id,
        (select max(decode(r2.xsequence,32,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat32_name,
           
                             (select max(decode(r2.xsequence,33,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat33_type,
        (select max(decode(r2.xsequence,33,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat33_desc,
        (select max(decode(r2.xsequence,33,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat33_id,
        (select max(decode(r2.xsequence,33,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat33_name,
           
                             (select max(decode(r2.xsequence,34,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat34_type,
        (select max(decode(r2.xsequence,34,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat34_desc,
        (select max(decode(r2.xsequence,34,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat34_id,
        (select max(decode(r2.xsequence,34,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat34_name,
           
                             (select max(decode(r2.xsequence,35,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat35_type,
        (select max(decode(r2.xsequence,35,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat35_desc,
        (select max(decode(r2.xsequence,35,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat35_id,
        (select max(decode(r2.xsequence,35,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat35_name,
           
                             (select max(decode(r2.xsequence,36,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat36_type,
        (select max(decode(r2.xsequence,36,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat36_desc,
        (select max(decode(r2.xsequence,36,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat36_id,
        (select max(decode(r2.xsequence,36,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat36_name,
           
                             (select max(decode(r2.xsequence,37,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat37_type,
        (select max(decode(r2.xsequence,37,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat37_desc,
        (select max(decode(r2.xsequence,37,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat37_id,
        (select max(decode(r2.xsequence,37,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat37_name,
           
                             (select max(decode(r2.xsequence,38,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat38_type,
        (select max(decode(r2.xsequence,38,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat38_desc,
        (select max(decode(r2.xsequence,38,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat38_id,
        (select max(decode(r2.xsequence,38,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat38_name,
                             (select max(decode(r2.xsequence,39,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat39_type,
        (select max(decode(r2.xsequence,39,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat39_desc,
        (select max(decode(r2.xsequence,39,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat39_id,
        (select max(decode(r2.xsequence,39,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat39_name,
           
                                        (select max(decode(r2.xsequence,40,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat40_type,
        (select max(decode(r2.xsequence,40,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat40_desc,
        (select max(decode(r2.xsequence,40,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat40_id,
        (select max(decode(r2.xsequence,40,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat40_name,
           
                                        (select max(decode(r2.xsequence,41,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat41_type,
        (select max(decode(r2.xsequence,41,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat41_desc,
        (select max(decode(r2.xsequence,41,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat41_id,
        (select max(decode(r2.xsequence,41,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat41_name,
           
                                        (select max(decode(r2.xsequence,42,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat42_type,
        (select max(decode(r2.xsequence,42,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat42_desc,
        (select max(decode(r2.xsequence,42,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat42_id,
        (select max(decode(r2.xsequence,42,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat42_name,
           
                                        (select max(decode(r2.xsequence,43,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat43_type,
        (select max(decode(r2.xsequence,43,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat43_desc,
        (select max(decode(r2.xsequence,43,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat43_id,
        (select max(decode(r2.xsequence,43,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat43_name,
           
                                        (select max(decode(r2.xsequence,44,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat44_type,
        (select max(decode(r2.xsequence,44,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat44_desc,
        (select max(decode(r2.xsequence,44,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat44_id,
        (select max(decode(r2.xsequence,44,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat44_name,
           
                                        (select max(decode(r2.xsequence,45,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat45_type,
        (select max(decode(r2.xsequence,45,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat45_desc,
        (select max(decode(r2.xsequence,45,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat45_id,
        (select max(decode(r2.xsequence,45,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat45_name,
           
                                        (select max(decode(r2.xsequence,46,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat46_type,
        (select max(decode(r2.xsequence,46,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat46_desc,
        (select max(decode(r2.xsequence,46,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat46_id,
        (select max(decode(r2.xsequence,46,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat46_name,
           
                                        (select max(decode(r2.xsequence,47,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat47_type,
        (select max(decode(r2.xsequence,47,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat47_desc,
        (select max(decode(r2.xsequence,47,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat47_id,
        (select max(decode(r2.xsequence,47,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat47_name,
           
                                        (select max(decode(r2.xsequence,48,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat48_type,
        (select max(decode(r2.xsequence,48,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat48_desc,
        (select max(decode(r2.xsequence,48,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat48_id,
        (select max(decode(r2.xsequence,48,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat48_name,
           
                                        (select max(decode(r2.xsequence,49,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat49_type,
        (select max(decode(r2.xsequence,49,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat49_desc,
        (select max(decode(r2.xsequence,49,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat49_id,
        (select max(decode(r2.xsequence,49,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat49_name,
           
                                        (select max(decode(r2.xsequence,50,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat50_type,
        (select max(decode(r2.xsequence,50,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat50_desc,
        (select max(decode(r2.xsequence,50,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat50_id,
        (select max(decode(r2.xsequence,50,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat50_name,
           
                                        (select max(decode(r2.xsequence,51,r2.relation_type_code,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat51_type,
        (select max(decode(r2.xsequence,51,t2.short_desc,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat51_desc,
        (select max(decode(r2.xsequence,51,e2.id_number,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat51_id,
        (select max(decode(r2.xsequence,51,e2.pref_mail_name,null))
          from relationship r2, tms_relationships t2, entity e2
         where r2.relation_id_number = e2.id_number
           and r.id_number = r2.id_number
           and t2.relation_type_code = r2.relation_type_code) relat51_name,


(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'BB') THEN '1' ELSE '0' END) baseball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'BKB') THEN '1' ELSE '0' END) basketball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'CC') THEN '1' ELSE '0' END) cross_country,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'FB') THEN '1' ELSE '0' END) football,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'GOLF') THEN '1' ELSE '0' END) golf,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'LAC') THEN '1' ELSE '0' END) lacrosse,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'RG') THEN '1' ELSE '0' END) rugby,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SB') THEN '1' ELSE '0' END) softball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SKI') THEN '1' ELSE '0' END) skiing,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SWIM') THEN '1' ELSE '0' END) swimming,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SOC') THEN '1' ELSE '0' END) soccer,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'TEN') THEN '1' ELSE '0' END) tennis,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'TF') THEN '1' ELSE '0' END) track_and_field,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'VB') THEN '1' ELSE '0' END) volleyball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'WR') THEN '1' ELSE '0' END) wrestling,
       
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'ASCSM') THEN '1' ELSE '0' END) ascsm,     
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'BAND') THEN '1' ELSE '0' END) band,   
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'CH') THEN '1' ELSE '0' END) choir, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'OOO') THEN '1' ELSE '0' END) order_of_omega, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'MHA') THEN '1' ELSE '0' END) mcbride,
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'BK') THEN '1' ELSE '0' END) blue_key_honor,
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'HSKKP') THEN '1' ELSE '0' END) kappa_kappa_psi_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSTBP') THEN '1' ELSE '0' END) tau_beta_pi_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'HSPET') THEN '1' ELSE '0' END) pi_epsilon_tau_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'HSSGE') THEN '1' ELSE '0' END) sigma_gamma_epsilon_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'TT') THEN '1' ELSE '0' END) theta_tau_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSAGD') THEN '1' ELSE '0' END) sor_alpha_gamma_delta,
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSAP') THEN '1' ELSE '0' END) sor_alpha_phi, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSPBP') THEN '1' ELSE '0' END) sor_pi_beta_phi, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSK') THEN '1' ELSE '0' END) sor_sigma_kappa, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSATO') THEN '1' ELSE '0' END) frat_alpha_phi_omega, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSBTP') THEN '1' ELSE '0' END) frat_beta_theta_pi, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSKS') THEN '1' ELSE '0' END) frat_kappa_sigma, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSPGD') THEN '1' ELSE '0' END) frat_phi_gamma_delta, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSAE') THEN '1' ELSE '0' END) frat_sigma_alpha_epsilon, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSN') THEN '1' ELSE '0' END) frat_sigma_nu, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSPE') THEN '1' ELSE '0' END) frat_sigma_phi_epsilon, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSAPO') THEN '1' ELSE '0' END) service_frat_alpha_phi_omega,

--LARGEST GIFT
NVL((select LTRIM(TO_CHAR(max(py.associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint),'$99,999,999,999.99'),' ')
from a_dw_pyramid py where py.id_number = r.id_number),'$'||0) largest_gift,
--LAST GIFT
NVL((select max(py2.date_of_record) from a_dw_pyramid py2 where py2.id_number = r.id_number),'Never') last_gift_date,       
--Total Giving (Note:  This is lifetime, total joint commitment)
NVL((select LTRIM(TO_CHAR(sum(py3.total_jnt_commitment),'$99,999,999,999.99'),' ') from a_dw_pyramid py3 where py3.flag_non_monthend <> 1 and py3.id_number = r.id_number),'$'||0) total_giving,
--Major Giving Capacity
NVL((select t.short_desc from demographic_profile  dp, tms_dp_rating t where dp.id_number = r.id_number and t.dp_rating_code = dp.dp_rating_code
 and dp.dp_rating_type_code = 'RMG'),'None') major_giving_capacity,
--Awards & Honors and Professional Socities
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'PP') THEN '1' ELSE '0' END) past_president,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'MM') THEN '1' ELSE '0' END) mines_medal,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'HOF') THEN '1' ELSE '0' END) ath_hall_of_fame,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'HDE') THEN '1' ELSE '0' END) hon_dr_eng,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'HDS') THEN '1' ELSE '0' END) hon_dr_sci,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'HEM') THEN '1' ELSE '0' END) hon_eng_of_mines,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'DA') THEN '1' ELSE '0' END) dist_achv_medal,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'CM') THEN '1' ELSE '0' END) coolbaugh_mem_awd,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'BM') THEN '1' ELSE '0' END) brown_medal,
(CASE WHEN r.id_number IN (select aw.id_number from awards_and_honors aw where aw.awd_honor_code = 'BS') THEN '1' ELSE '0' END) boettcher_scholar,
--Up to 5 degrees     
        (select max(decode(deg.xsequence,1,deg.degree_year,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree1_year,
         (select max(decode(deg.xsequence,1,deg.degree_level_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree1_level,
        (select max(decode(deg.xsequence,1,deg.major_code1_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree1_major,
       (select max(decode(deg.xsequence,2,deg.degree_year,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree2_year,
         (select max(decode(deg.xsequence,2,deg.degree_level_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree2_level,
        (select max(decode(deg.xsequence,2,deg.major_code1_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree2_major,
        (select max(decode(deg.xsequence,3,deg.degree_year,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree3_year,
         (select max(decode(deg.xsequence,3,deg.degree_level_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree3_level,
        (select max(decode(deg.xsequence,3,deg.major_code1_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree3_major,
        (select max(decode(deg.xsequence,4,deg.degree_year,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree4_year,
         (select max(decode(deg.xsequence,4,deg.degree_level_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree4_level,
        (select max(decode(deg.xsequence,4,deg.major_code1_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree4_major,
        (select max(decode(deg.xsequence,5,deg.degree_year,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree5_year,
         (select max(decode(deg.xsequence,5,deg.degree_level_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree5_level,
        (select max(decode(deg.xsequence,5,deg.major_code1_desc,null))
          from a_dw_degrees deg
         where deg.institution_code = '1'
           and deg.degree_code <> '401'
           and deg.id_number = r.id_number         ) degree5_major,
--last 4 employers
(select dw.employer_name1
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence) from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_1,
(select dw.job_title
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence) from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_1_title,
(select dw.employer_name1
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence)-1 from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_2,
(select dw.job_title
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence)-1 from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_2_title,
(select dw.employer_name1
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence)-2 from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_3,
(select dw.job_title
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence)-2 from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_3_title,    
(select dw.employer_name1
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence)-3 from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_4,  
(select dw.job_title
from a_dw_jobs  dw
where dw.id_number = r.id_number
and   dw.xsequence =
    (select max(dw2.xsequence)-3 from a_dw_jobs dw2 where dw2.id_number = dw.id_number)) employer_4_title    
    
 from relationship r,
       entity e
where e.id_number = r.id_number
  and (
        (
         e.id_number IN 
            (select id_number from demographic_profile where dp_rating_type_code = 'RMG' and dp_rating_code IN ('RP06','RP05','RP04','RP03','RP02','RP01'))
         )
        OR
        (
         e.id_number IN
            (select id_number from
                (select id_number, sum(total_jnt_commitment)
                   from a_dw_pyramid
                  where flag_alumni <> 1
                    and flag_non_monthend <> 1
               group by id_number
             having sum(total_jnt_commitment) >= 10000))
         )
         OR
         (
         e.id_number IN
             (select id_number from a_dw_pyramid where flag_alumni <> 1 and flag_non_monthend <> 1 and associated_amount+associated_amount_match+              associated_amount_claim+associated_amount_joint >= 1000)
         )
         OR
         (
         e.id_number IN
             (select id_number from committee where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN') and committee_status_code IN ('A'))
         )
         OR
         (
         e.id_number IN
            (select id_number from employment where job_status_code = 'C' and employ_relat_code = 'PE' and employer_id_number IN
                (SELECT  id_number FROM a_dw_faculty_staff_org_ids))
          )
      )    
   group by r.id_number, e.person_or_org, e.record_status_code, e.pref_mail_name
--select * from relationship
--select * from tms_relationships