SET SERVEROUTPUT ON;
SET VERIFY OFF;
clear screen;


--search by language
DECLARE

	A integer;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Search By Language(Bangla):'||CHR(10));
	FOR R IN (select name,age,gender,religion from data1 where age>2 union all select name,age,gender,religion from data1@site1 where age>5 order by age) LOOP
	
		DBMS_OUTPUT.PUT_LINE('Name:'||R.name||' ||' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion); 
		
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
END;
/




