clear screen;


/*column name format a10
column age format 99
column gender format a10
column religion format a10
column height format 9.9
column occupation format a10
column home_Town format a10
column language format a10*/

--create table data1( id number not null primary key,name varchar2(50),age integer,gender varchar2(2));

create table data1( id number not null primary key,name varchar2(50),age integer,gender varchar2(2),religion varchar2(50),height float,occupation varchar2(50),home_Town varchar2(50),language varchar2(50));

--insert into data values ('Tanjil',20,'M','islam',5.6,'Student','Kushtia','Bangla');

--select * from data;

commit;


