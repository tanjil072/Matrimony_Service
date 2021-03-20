SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET FEEDBACK OFF;


DECLARE 

 BEGIN
	 dbms_output.put_line(CHR(10));
     dbms_output.put_line('1. Insert');
     dbms_output.put_line('2. Delete');
	 dbms_output.put_line('3. Update');
	 dbms_output.put_line('4. Search');
	 dbms_output.put_line('5. Show');
	 
	 dbms_output.put_line(CHR(10));
	 dbms_output.put_line('Search By:');
	 dbms_output.put_line('Type 1 for age>20');
	 dbms_output.put_line('Type 2 for Language=Bangla');
	 dbms_output.put_line('Type 3 for Language=English');
	 dbms_output.put_line('Type 4 for Gender=Male');
	 dbms_output.put_line('Type 5 for Gender=Female');
	 dbms_output.put_line('Type 6 for Occupation=Doctor');
	 dbms_output.put_line('Type 7 for Occupation=Engineer');
	 dbms_output.put_line('Type 8 for Height=5.2"-5.5" and Gender=Female');
	 dbms_output.put_line('Type 9 for Height=5.2"-5.11" and Gender=Male');
	 dbms_output.put_line('Type 10 for Religion=Islam and Gender=Female and Occupation=Engineer');
	 
	 
	 dbms_output.put_line(CHR(10));
		
	 
   END;
 /	
  
  
  
ACCEPT X NUMBER PROMPT 'Please choose an option:'
DECLARE 
	A NUMBER;
	name varchar2(100);
	age integer;
	gender varchar2(2);
	religion varchar2(30);
	height float;
	occupation varchar2(50);
	home_Town varchar2(100);
	language varchar2(50);
	delete_id integer;
	update_id integer;
	searchOption number;
	noInput EXCEPTION;
	temp NUMBER;
	
	
	
 BEGIN
     
	A :=&X;
	name:='&Name';
	age:=&Age;
	gender:='&Gender';
	religion:='&Religion';
	height:=&Height;
	occupation:='&Occupation';
	home_Town:='&HomeTown';
	language:='&Language';
	
	
	IF A = 1 THEN
		
		IF name is null or age<0 or gender is null or religion is null or height<0 or occupation is null or home_Town is null or language is null THEN
	
			RAISE noInput;
		ELSE
			mypack.Insert_Entry(name,age,gender,religion,height,occupation,home_Town,language);
	
		END IF;
			
	
			
	ELSIF A = 2 THEN
	
		delete_id:=&Id_to_delete;
		
		mypack.Delete_Entry(delete_id);
	ELSIF A = 3 THEN
	
		update_id:=&ID_To_Update;
		
		mypack.Upd(update_id,name,age,gender,religion,height,occupation,home_Town,language);
		
	ELSIF A = 4 THEN
		searchOption:=&choose_How_You_Want_To_Search;
		mypack.Search_Entry(searchOption);
		
	ELSIF A = 5 THEN
		temp:=mypack.show();
		
		
	END IF;
	
	

	--Exception if no input given
	
	EXCEPTION 
		WHEN noInput THEN 
			dbms_output.put_line('Please input Valid Data');
		
	
	
   END;
  /	
  
SET FEEDBACK ON;
  
  
