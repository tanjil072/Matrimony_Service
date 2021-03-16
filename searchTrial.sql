SET SERVEROUTPUT ON;
SET VERIFY OFF;
clear screen;



SET FEEDBACK OFF;

--search by language
DECLARE

	A integer;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Search By Language(Bangla):'||CHR(10));
	FOR R IN (select * from data2@site2 where language='Bangla') LOOP
		A:=R.id_;
		FOR S IN(select * from data1@site1 where id=A) LOOP
			DBMS_OUTPUT.PUT_LINE('Name:'||S.name||'  || ' || ' Age:'||S.age ||' || ' || ' Gender:' ||S.gender ||' || ' || ' Religion:' ||R.religion); 
		
		END LOOP;
		
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
END;
/


--search by age range

DECLARE

	A integer;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Search By Age Range(20 To 25):'||CHR(10));
	
	FOR R IN (select * from data1@site1 where age>20 AND age<25) LOOP
		A:=R.id;
		
		FOR S IN(select * from data2@site2 where id_=A) LOOP
			DBMS_OUTPUT.PUT_LINE('Name:'||R.name||' ||' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||S.religion); 
		
		END LOOP;
		
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	
END;
/

--search by age range

DECLARE

	A integer;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Search By Gender(F):'||CHR(10));
	
	FOR R IN (select * from data1@site1 where gender='F') LOOP
		A:=R.id;
		
		FOR S IN(select * from data2@site2 where id_=A) LOOP
			DBMS_OUTPUT.PUT_LINE('Name:'||R.name||'  || ' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||S.religion ||' || ' ||' HomeTown:' ||S.home_t ); 
		
		END LOOP;
		
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	
END;
/

SET FEEDBACK ON;

