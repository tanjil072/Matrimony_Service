SET SERVEROUTPUT ON;

DROP TRIGGER Inserting;
DROP TRIGGER Updating;
DROP TRIGGER Deletion;

CREATE OR REPLACE TRIGGER Inserting
AFTER INSERT  
ON data1
FOR EACH ROW

DECLARE

BEGIN

	DBMS_OUTPUT.PUT_LINE('Insertion completed.');

END;
/

CREATE OR REPLACE TRIGGER Updating
BEFORE UPDATE OF name,age,gender,religion,height,occupation,home_Town,language ON data1
FOR EACH ROW

DECLARE
	A data1.id%TYPE;
	B data1.name%TYPE;
	C data1.age%TYPE;
	D data1.gender%TYPE;
	E data1.religion%TYPE;
	F data1.height%TYPE;
	G data1.occupation%TYPE;
	H data1.home_Town%TYPE;
	I data1.language%TYPE;

BEGIN
	A:=:OLD.id;
	B:=:OLD.name;
	C:=:OLD.age;
	D:=:OLD.gender;
	E:=:OLD.religion;
	F:=:OLD.height;
	G:=:OLD.occupation;
	H:=:OLD.home_Town;
	I:=:OLD.language;
	
	INSERT INTO tempData values(A,B,C,D,E,F,G,H,I);
	DBMS_OUTPUT.PUT_LINE('Successfully Updated.');


END;
/



CREATE OR REPLACE TRIGGER Deletion
AFTER DELETE  
ON data1
FOR EACH ROW

DECLARE

BEGIN

	DBMS_OUTPUT.PUT_LINE('Successfully Deleted.');

END;
/

