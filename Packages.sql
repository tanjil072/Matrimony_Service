SET SERVEROUTPUT ON;


CREATE OR REPLACE PACKAGE mypack 
AS 
	PROCEDURE Insert_Entry(name in varchar2,age in integer,gender in varchar2,religion in varchar2,height in float,occupation in varchar2,home_Town in varchar2,language in varchar2);
	PROCEDURE Delete_Entry(B IN NUMBER);
	PROCEDURE Search_Entry;

END mypack; 
/



CREATE OR REPLACE PACKAGE BODY mypack 
AS 
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
	
	
	PROCEDURE Search_Entry IS
	BEGIN
		dbms_output.put_line('Search Entry called'); 
	END Search_Entry;
	
	
	
	
	
END mypack; 
/


