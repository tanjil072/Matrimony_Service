SET SERVEROUTPUT ON;
SET LINESIZE 32000;




CREATE OR REPLACE PACKAGE mypack 
AS 
	PROCEDURE Insert_Entry(name in varchar2,age in integer,gender in varchar2,religion in varchar2,height in float,occupation in varchar2,home_Town in varchar2,language in varchar2);
	PROCEDURE Delete_Entry(B IN NUMBER);
	PROCEDURE Search_Entry(Options in number);
	PROCEDURE Upd(A in integer,name1 in varchar2,age1 in integer,gender1 in varchar2,religion1 in varchar2,height1 in float,occupation1 in varchar2,home_Town1 in varchar2,language1 in varchar2);
	FUNCTION  Show RETURN NUMBER;
	
END mypack; 
/








CREATE OR REPLACE PACKAGE BODY mypack 
AS 

	--Insert Entry

	PROCEDURE Insert_Entry(name in varchar2,age in integer,gender in varchar2,religion in varchar2,height in float,occupation in varchar2,home_Town in varchar2,language in varchar2) IS
	
	
	A number;
	dupConst EXCEPTION;
	maximum number:=0;
	C number;
	max2 NUMBER:=0;
	
	BEGIN
		
		
		FOR R IN (SELECT id FROM data1) LOOP
	
			A:=R.id;
			IF A>maximum THEN
				maximum:=A;
				
			END IF;
		
		END LOOP;
		
		
		IF maximum is NULL OR maximum=0 THEN

			maximum:=1;
			--insert into data1@site1 values(A,name,age,gender);

			--insert into data2@site2 values(A,religion,height,occupation,home_Town,language);
			insert into data1 values(maximum,name,age,gender,religion,height,occupation,home_Town,language);
			
			commit;
		
		ELSE
		
			maximum:=maximum+1;
				
			IF maximum<=10 THEN
				insert into data1 values(maximum,name,age,gender,religion,height,occupation,home_Town,language);
				commit;
			
			END IF;
			
			IF maximum>10 THEN
				--DBMS_OUTPUT.PUT_LINE(maximum);
				
				
				FOR S IN (SELECT id FROM data1@site1) LOOP
	
					C:=S.id;
					IF C>max2 THEN
						max2:=C;
				
					END IF;
		
				END LOOP;
				
				insert into data1@site1 values(max2+1,name,age,gender,religion,height,occupation,home_Town,language);
				commit;
			
			END IF;
			

		END IF;
	
		
	END Insert_Entry;
	
	--Delete entry
	
	
	PROCEDURE Delete_Entry(B IN NUMBER) IS
	
	BEGIN
		IF B>=1 AND B<=10 THEN
			DELETE FROM data1 WHERE id=B;
			commit;
	
		END IF;
	
		IF B>10 THEN
			DELETE FROM data1@site1 WHERE id=B;
			commit;
	
		END IF;
		
		
	END Delete_Entry;
	
	
	--UPDATING value
	
	
	PROCEDURE Upd(A in integer,name1 in varchar2,age1 in integer,gender1 in varchar2,religion1 in varchar2,height1 in float,occupation1 in varchar2,home_Town1 in varchar2,language1 in varchar2) IS
	BEGIN
		
		IF A<=10 THEN
			--DBMS_OUTPUT.PUT_LINE('The Name is' ||name1);
			UPDATE data1 SET name=name1,age=age1,gender=gender1,religion=religion1,height=height1,occupation=occupation1,home_Town=home_Town1,language=language1 WHERE id=A;
			commit;
		ELSIF A>10 THEN
			--DBMS_OUTPUT.PUT_LINE('The Name is' ||name1);
			UPDATE data1@site1 SET name=name1,age=age1,gender=gender1,religion=religion1,height=height1,occupation=occupation1,home_Town=home_Town1,language=language1 WHERE id=A;
			commit;
		
		END IF;
	
	END Upd;
	
	
	
	--Searching 
	
	PROCEDURE Search_Entry(Options in number) IS
	BEGIN
	
		IF Options=1 THEN
			
				
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Age(Greater than 20):'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where age>20 union select id,name,age,gender,religion,occupation,home_Town,height,language from data1@site1 where age>20 order by age) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
			
		ELSIF Options=2 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Language(Bangla):'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where language='Bangla' union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where language='Bangla' order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
			
		ELSIF Options=3 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Language(English):'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where language='English' union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where language='English' order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
		ELSIF Options=4 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Gender(Male):'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where gender='M' union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where gender='M' order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
		ELSIF Options=5 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Gender(Female):'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where gender='F' union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where gender='F' order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
		
		
		ELSIF Options=6 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Occupation(Doctor):'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where occupation='Doctor' union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where occupation='Doctor' order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
		ELSIF Options=7 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Occupation(Engineer):'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where occupation='Engineer' union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where occupation='Engineer' order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
			
		ELSIF Options=8 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Height=5.2-5.5 and Gender=Female:'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where gender='F' AND height>=5.2 AND height<=5.5 union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where gender='F' AND height>=5.2 AND height<=5.5 order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
		ELSIF Options=9 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Height=5.2"-5.11" and Gender=Male:'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where gender='M' AND height>=5.2 AND height<=5.11 union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where gender='M' AND height>=5.2 AND height<=5.11 order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
			
		ELSIF Options=10 THEN
			
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Religion=Islam and Gender=Female and Occupation=Engineer:'||CHR(10));
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			FOR R IN (select id,name,age,gender,religion,occupation,home_Town,height,language from data1 where gender='F' AND occupation='Engineer' AND religion='Islam' union select id,name,age,gender,occupation,religion,home_Town,height,language from data1@site1 where gender='F' AND occupation='Engineer' AND religion='Islam' order by id) LOOP
	
				DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		
			END LOOP;
			
		
		END IF;
		
	END Search_Entry;
	
	
		--Show Function	
	
	FUNCTION show
		RETURN NUMBER AS

	BEGIN
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		DBMS_OUTPUT.PUT_LINE('Showing Data:');
		DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		FOR R IN ((select * from data1@site1) UNION (select * from data1)) LOOP
		
		DBMS_OUTPUT.PUT_LINE('ID:'||R.id||' || ' ||'Name:'||R.name||' || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Occupation:' ||R.occupation||' || ' || ' Height:' ||R.height ||' || ' || ' HomeTown:' ||R.home_Town ||' || ' || ' Language:' ||R.language); 
		DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------------------');
		--DBMS_OUTPUT.PUT_LINE(CHR(10));
		END LOOP;
		

		RETURN 1;
		
		--Exception if no data found 
	
	EXCEPTION
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
				
	END show;
	
	
			


		
		

	
	
	
	
END mypack; 
/


