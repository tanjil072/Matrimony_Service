SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET FEEDBACK OFF;



ACCEPT X NUMBER PROMPT 'Enter ID to Delete:';
DECLARE
	B number;

BEGIN
	B:=&X;
	
	IF B>=1 AND B<=10 THEN
		DELETE FROM data1 WHERE id=B;
		commit;
	
	END IF;
	
	IF B>10 THEN
		DELETE FROM data1@site1 WHERE id=B;
		commit;
	
	END IF;
	
	

END;
/
