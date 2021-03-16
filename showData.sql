SET FEEDBACK OFF;


clear screen;
column id format 99
column id_ format 99
column name format a10
column age format 99
column gender format a10
column religion format a10
column height format 9.9
column occupation format a10
column home_Town format a10
column language format a10



select * from data1;
select * from data1@site1;
(select * from data1@site1) UNION (select * from data1);

--SELECT name FROM data1@site1 INNER JOIN data2@site2 ON data1@site1.id = data2@site2.id_;
--(select name from data1@site1) UNION (select language from data2@site2);
--select religion,height,occupation,home_town,language from data2@site2 where id_=( (select id from data1@site1 where age=22));

--select id_ from data2@site2 where language='Bangla';
--select name from data1@site1 where id=1;

SET FEEDBACK ON;