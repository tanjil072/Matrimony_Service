clear screen;
SET SERVEROUTPUT ON;
SET LINESIZE 32000;
column id format 99
column name format a20
column age format 99
column gender format a10
column religion format a10
column height format 9.9
column occupation format a10
column home_Town format a10
column language format a10

select * from data1 union select * from data1@site1;


