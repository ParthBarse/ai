-- 


create table borrower_main(
    rollin int primary key,
    name varchar(20),
    dateofissue date,
    nameofbook varchar(20),
    status varchar(20)
);

create table fine(
    rollno int,foreign key(rollno) 
    references borrower_main(rollin),
    returndate date,amount int
);

insert into borrower_main values(1,'abc','01-AUG-2017','SEPM','PEN');
insert into borrower_main values(2,'xyz','01-JULY-2017','DBMS','PEN');
insert into borrower_main values(3,'pqr','08-AUG-2015','DBMS','PEN');



CREATE OR REPLACE PROCEDURE calc_fine_lib(p_roll NUMBER) AS
    roll NUMBER := p_roll;
    fine1 NUMBER;
    noofdays INT;
    issuedate DATE;
BEGIN
    -- Select the issue date for the provided roll number
    SELECT dateofissue INTO issuedate FROM borrower_main WHERE rollin = roll;
    
    -- Calculate the number of days overdue
    SELECT SYSDATE - issuedate INTO noofdays FROM dual;

    -- Calculate the fine based on the number of days overdue
    IF noofdays > 15 AND noofdays <= 30 THEN
        fine1 := noofdays * 5;
        dbms_output.put_line('FINE :'||fine1);
    ELSIF noofdays > 30 THEN
        fine1 := ((noofdays - 30) * 50) + (15 * 5);
        dbms_output.put_line('FINE :'||fine1);
    ELSE
        fine1 := 0;
        dbms_output.put_line('FINE :'||fine1);
    END IF;

    -- Insert the fine details into the fine table
    INSERT INTO fine VALUES (roll, SYSDATE, fine1);
    
    -- Update the status in borrower_main
    UPDATE borrower_main SET status = 'return' WHERE rollin = roll;
    
    COMMIT;
END calc_fine_lib;
/

EXECUTE calc_fine_lib(1);
