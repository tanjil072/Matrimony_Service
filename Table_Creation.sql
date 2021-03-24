clear screen;



--Server Side Table Creation
create table data1( id number not null primary key,name varchar2(50),age integer,gender varchar2(2),religion varchar2(50),height number,occupation varchar2(50),home_Town varchar2(50),language varchar2(50));

--insert into data values ('Tanjil',20,'M','islam',5.6,'Student','Kushtia','Bangla');


--For storing temporary data
create table tempData( id number not null primary key,name varchar2(50),age integer,gender varchar2(2),religion varchar2(50),height number,occupation varchar2(50),home_Town varchar2(50),language varchar2(50));


--Table For Site1 which needs to be executed at site1

	--create table data1( id number,name varchar2(50),age integer,gender varchar2(2),religion varchar2(50),height number,occupation varchar2(50),home_Town varchar2(50),language varchar2(50));


commit;

