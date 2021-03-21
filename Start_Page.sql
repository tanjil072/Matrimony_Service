SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET FEEDBACK OFF;


DECLARE 

 BEGIN
	 dbms_output.put_line(CHR(10));
	 dbms_output.put_line('Section 1(Options)');
	 dbms_output.put_line('------------------');
     dbms_output.put_line('1. Insert');
     dbms_output.put_line('2. Delete');
	 dbms_output.put_line('3. Update');
	 dbms_output.put_line('4. Search');
	 dbms_output.put_line('5. Show');
	 
	 dbms_output.put_line(CHR(10));
	 dbms_output.put_line('Section 2(Search By)');
	 dbms_output.put_line('--------------------');
	 dbms_output.put_line('Type 1 for age>20');
	 dbms_output.put_line('Type 2 for Language=Bangla');
	 dbms_output.put_line('Type 3 for Language=English');
	 dbms_output.put_line('Type 4 for Gender=Male');
	 dbms_output.put_line('Type 5 for Gender=Female');
	 dbms_output.put_line('Type 6 for Occupation=Doctor');
	 dbms_output.put_line('Type 7 for Occupation=Engineer');
	 dbms_output.put_line('Type 8 for Occupation=Actor');
	 dbms_output.put_line('Type 9 for Occupation=Actress');
	 dbms_output.put_line('Type 10 for Occupation=Teacher');
	 dbms_output.put_line('Type 11 for Height=5.2"-5.5" and Gender=Female');
	 dbms_output.put_line('Type 12 for Height=5.2"-5.11" and Gender=Male');
	 dbms_output.put_line('Type 13 for Religion=Islam and Gender=Female and Occupation=Engineer');
	 
	 
	 dbms_output.put_line(CHR(10));
		
	 
   END;
 /	
  
  
  
accept x NUMBER PROMPT 'Please Select an option from Section 1:'
accept name1 char prompt 'Enter Name:'
accept age1 number prompt 'Enter Age:'
accept gender1 char prompt 'Enter Gender:'
accept religion1 char prompt 'Enter Religion:'
accept height1 number prompt 'Enter Height:'
accept occupation1 char prompt 'Enter Occupation:'
accept home_Town1 char prompt 'Enter Home Town:'
accept language1 char prompt 'Enter Language:'

accept idToDel number prompt 'Enter ID to DELETE:'
accept idToUpd number prompt 'Enter ID to UPDATE:'
accept searchOpt char prompt 'Select an option from Section 2(Search By):'



DECLARE 

	A NUMBER:=&x;
	name varchar2(100):='&name1';
	age integer:=&age1;
	gender varchar2(2):='&gender1';
	religion varchar2(30):='&religion1';
	height number:=&height1;
	occupation varchar2(50):='&occupation1';
	home_Town varchar2(100):='&Home_Town1';
	language varchar2(50):='&language1';
	delete_id integer:=&idToDel;
	update_id integer:=&idToUpd;
	searchOption number:=&searchOpt;
	
	noInput EXCEPTION;
	temp NUMBER;
	
	
	
 BEGIN
	
	IF A<=0 OR A>5 OR searchOption<=0 OR searchOption>10 THEN
		RAISE noInput;
	
	END IF;
	
	
     
	IF A = 1 THEN
		
		IF name is null or age<0 or gender is null or religion is null or height<0 or occupation is null or home_Town is null or language is null THEN
	
			RAISE noInput;
		ELSE
			mypack.Insert_Entry(name,age,gender,religion,height,occupation,home_Town,language);
	
		END IF;
			
	
			
	ELSIF A = 2 THEN
		
		mypack.Delete_Entry(delete_id);
	ELSIF A = 3 THEN
		
		mypack.Upd(update_id,name,age,gender,religion,height,occupation,home_Town,language);
		
	ELSIF A = 4 THEN
	
		mypack.Search_Entry(searchOption);
		
	ELSIF A = 5 THEN
		temp:=mypack.show();
		
		
	END IF;
	
	

	--Exception if no input given
	
	EXCEPTION 
		WHEN noInput THEN 
			DBMS_OUTPUT.PUT_LINE('Please input Valid Data');
			
		WHEN VALUE_ERROR THEN
			DBMS_OUTPUT.PUT_LINE('Please input Valid Data');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Please input Valid Data');
	
	
   END;
  /	
  
SET FEEDBACK ON;
  
  
