/*** Add Flags to specific ID#'s ***/
select id_number,
(CASE
WHEN id_number IN (select id_number from a_dw_gift_clubs where pc11='1') THEN 'X'
ELSE ' '
END) pc11,
(CASE
WHEN id_number IN (select id_number from a_dw_gift_clubs where pc12='1') THEN 'X'
ELSE ' '
END) pc12,
(CASE
WHEN id_number IN(select id_number from a_dw_memb where memb_type_code = 'L') THEN 'X'
ELSE ' '
END) csmaa_life_memb
from entity
where id_number IN
(
0000046120	,
0000004139	,
0000046614	,
0000002972	,
0000044313	,
0000010907	,
0000031465	,
0000011908	,
0000013993	,
0000006271	,
0000006635	,
0000046675	,
0000006637	,
0000005956	,
0000044605	,
0000014251	,
0000016303	,
0000039837	,
0000011683	,
0000034163	,
0000030142	,
0000005607	,
0000047532	,
0000026325	,
0000026326	,
0000042809	,
0000046709	,
0000007049	,
0000005423	,
0000013092	,
0000017243	,
0000038445	,
0000008397	,
0000007312	,
0000005082	,
0000010655	,
0000003205	,
0000010231	,
0000005085	,
0000006876	,
0000006473	,
0000017401	,
0000009618	,
0000004781	,
0000039863	,
0000006826	,
0000012248	,
0000027507	,
0000011718	,
0000011251	,
0000011879	,
0000025872	,
0000010693	,
0000014294	,
0000005801	,
0000011743	,
0000008097	,
0000047541	,
0000046854	,
0000033655	,
0000047483	,
0000037700	,
0000039579	,
0000044240	,
0000042698	,
0000009970	,
0000013281	,
0000035385	,
0000045342	,
0000045732	,
0000041387	,
0000046883	,
0000003258	,
0000014333	,
0000005117	,
0000006701	,
0000010654	,
0000030729	,
0000040443	,
0000027599	,
0000007681	,
0000011309	,
0000047007	,
0000015026	,
0000042608	,
0000046420	,
0000052683	,
0000012267	,
0000011462	,
0000008523	,
0000042658	,
0000012869	,
0000013164	,
0000014331	,
0000010831	,
0000012788	,
0000046922	,
0000012211	,
0000004484	,
0000005677	,
0000011960	,
0000012819	,
0000031084	,
0000047003	,
0000044610	,
0000010046	,
0000043911	,
0000007994	,
0000034988	,
0000004496	,
0000010876	,
0000006758	,
0000036554	,
0000016242	,
0000006573	,
0000038844	,
0000008570	,
0000007203	,
0000027577	,
0000030526	,
0000006076	,
0000030406	,
0000006086	,
0000038329	,
0000034802	,
0000026433	,
0000016263	,
0000047097	,
0000038376	,
0000006996	,
0000046270	,
0000016005	,
0000037734	,
0000013175	,
0000016134	,
0000047069	,
0000033094	,
0000030801	,
0000014736	,
0000013453	,
0000013725	,
0000016479	,
0000014875	,
0000046132	,
0000006434	,
0000016069	,
0000046495	,
0000013242	,
0000006610	,
0000005737	,
0000015186	,
0000014517	,
0000006822	,
0000006612	,
0000013178	,
0000006440	,
0000044006	,
0000011020	,
0000010567	,
0000043475	,
0000043446	,
0000045262	,
0000055924	,
0000047393	,
0000055197	,
0000052418	,
0000047519	,
0000052102	,
0000044024	,
0000052202	,
0000044696	,
0000044861	,
0000044572	,
0000047643	,
0000045873	,
0000047683	,
0000051687	,
0000043457	,
0000046072	,
0000055805	,
0000047073	,
0000044093	,
0000045786	,
0000044624	,
0000052384	,
0000043723	,
0000044531	,
0000045490	,
0000046842	,
0000055740	,
0000044523	,
0000057443	,
0000044200	,
0000051866	,
0000046296	,
0000055402	,
0000058646	,
0000050494	,
0000052728	,
0000054570	,
0000057526	,
0000044706	,
0000056343	,
0000052628	,
0000033235	,
0000040494	,
0000020612	,
0000020026	,
0000028979	,
0000026497	,
0000036719	,
0000014474	,
0000051025	,
0000029461	,
0000050007	,
0000029694	,
0000050563	,
0000048536	,
0000047840	,
0000057211	,
0000040535	,
0000051503	,
0000009011	,
0000029847	,
0000040043	,
0000041115	,
0000013859	,
0000024505	,
0000007680	,
0000029456	,
0000026020	,
0000008826	,
0000036923	,
0000039298	,
0000026490	,
0000025264	,
0000039315	,
0000039248	,
0000007773	,
0000011443	,
0000028866	,
0000036264	,
0000011218	,
0000008911	,
0000060110	,
0000055114	,
0000060100	,
0000054815	,
0000006186	,
0000057395	,
0000024217	,
0000060501	,
0000033218	,
0000012337	,
0000038566	,
0000029845	,
0000037851	,
0000059005	,
0000057875	)




order by id_number