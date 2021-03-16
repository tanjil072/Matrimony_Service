SET SERVEROUTPUT ON;
SET VERIFY OFF;
clear screen;


--search by age
DECLARE

	A integer;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Search By Age(Greater than 2):'||CHR(10));
	FOR R IN (select name,age,gender,religion from data1 where age>2 union all select name,age,gender,religion from data1@site1 where age>5 order by age) LOOP
	
		DBMS_OUTPUT.PUT_LINE('Name:'||R.name||' ||' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion); 
		
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
END;
/


DECLARE

	A integer;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Search By language:'||CHR(10));
	FOR R IN (select * from data1 where language='Bangla') LOOP
		FOR S IN (select * from data1@site1 where language='Bangla') LOOP
	
			
			DBMS_OUTPUT.PUT_LINE('Name:'||S.id||' ||' || ' Age:'||S.age ||' || ' || ' Gender:' ||S.gender ||' || ' || ' Religion:' ||S.religion ||' || ' || ' Language:' ||S.language); 
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('Name:'||R.name||' ||' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion ||' || ' || ' Language:' ||R.language); 
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
END;
/




