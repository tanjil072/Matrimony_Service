SET SERVEROUTPUT ON;

DROP TRIGGER Inserting;
DROP TRIGGER Updating;
DROP TRIGGER Deletion;


--Trigger will be called on insertion of data on data1 table
CREATE OR REPLACE TRIGGER Inserting
AFTER INSERT  
ON data1
FOR EACH ROW

DECLARE

BEGIN

	DBMS_OUTPUT.PUT_LINE('Insertion complete.');

END;
/


--Trigger will be called before update of server side data1 table

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
	
	--Storing the value of specific id which is being updated into tempData Table;
	INSERT INTO tempData values(A,B,C,D,E,F,G,H,I);
	DBMS_OUTPUT.PUT_LINE('Successfully Updated Values For ID:'||A);



END;
/


--Trigger will be called after deleting data from server side

CREATE OR REPLACE TRIGGER Deletion
AFTER DELETE  
ON data1
FOR EACH ROW

DECLARE

BEGIN

	DBMS_OUTPUT.PUT_LINE('Successfully Deleted.');

END;
/

