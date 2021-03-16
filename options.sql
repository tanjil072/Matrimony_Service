SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET FEEDBACK OFF;


DECLARE 

 BEGIN
     dbms_output.put_line('1. Insert');
     dbms_output.put_line('2. Delete');
	 dbms_output.put_line('3. Search');
	 
	 dbms_output.put_line(CHR(10));
	 dbms_output.put_line('Search Options:');
	 dbms_output.put_line('Type 1 for age>2');
	 dbms_output.put_line('Type 2 for Language=Bangla');
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
	searchOption number;
	
	noInput EXCEPTION;
	
 BEGIN
     
	A :=&X;
	
	IF A = 1 THEN
		name:='&Name';
		age:=&Age;
		gender:='&Gender';
		religion:='&Religion';
		height:=&Height;
		occupation:='&Occupation';
		home_Town:='&HomeTown';
		language:='&Language';
			
		IF name is null or age<0 or gender is null or religion is null or height<0 or occupation is null or home_Town is null or language is null THEN
	
			RAISE noInput;
		ELSE
			mypack.Insert_Entry(name,age,gender,religion,height,occupation,home_Town,language);
	
		END IF;
			
	
			
	ELSIF A = 2 THEN
	
		delete_id:=&Id_to_delete;
		
		mypack.Delete_Entry(delete_id);
		
	ELSIF A = 3 THEN
		searchOption:=&choose_How_You_Want_To_Search;
	
		IF searchOption=1 THEN
			
				
			DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Search By Age(Greater than 2):'||CHR(10));
			FOR R IN (select name,age,gender,religion from data1 where age>2 union all select name,age,gender,religion from data1@site1 where age>5 order by age) LOOP
	
				DBMS_OUTPUT.PUT_LINE('Name:'||R.name||' ||' || ' Age:'||R.age ||' || ' || ' Gender:' ||R.gender ||' || ' || ' Religion:' ||R.religion); 
		
			END LOOP;
				
		
		END IF;
		
		
		--mypack.Search_Entry;
		
	END IF;
	
	
	EXCEPTION 
		WHEN noInput THEN 
			dbms_output.put_line('Please input Valid Data');
		
	
	
   END;
  /	
  
SET FEEDBACK ON;
  
  
