SET SERVEROUTPUT ON;



CREATE OR REPLACE FUNCTION CheckMax(Num IN NUMBER, Num2 OUT NUMBER)
RETURN NUMBER
IS
Maxi NUMBER:=0;

BEGIN
	IF Num>Maxi THEN
	
		Maxi:=Num;
	
	
	END IF;
	
	Return Maxi;


END CheckMax;
/

DECLARE
A number;
Maxim number;
BEGIN
	A:=Maxi(5,maxim);
	
END;