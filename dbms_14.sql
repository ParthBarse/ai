-- Consider table Stud(Roll, Att, Status) Write a PL/SQL block for following requirement and handle the exceptions. Roll no. of student will be entered by user. Attendance of roll no. entered by user will be checked in Stud table. If attendance is less than 75% then display the message “Term not granted” and set the status in stud table as “D”. Otherwise display message “Term granted” and set the status in stud table as “ND”


set serveroutput on;

create table stud_main(
   roll_no number(5),
   attendance number(5),
   status varchar(7));

Insert into stud_main(roll_no, attendance) values(101, 80);
Insert into stud_main(roll_no, attendance) values(102, 65);
Insert into stud_main(roll_no, attendance) values(103, 92);
Insert into stud_main(roll_no, attendance) values(104, 55);
Insert into stud_main(roll_no, attendance) values(105, 98);

Declare
   roll number(10);
   att number(10);
Begin
   roll := &roll;
   select attendance into att from stud_main where roll_no = roll;
   if att < 75 then
      dbms_output.put_line(roll||' is detained');
      update stud_main set status='D' where roll_no=roll;
   else 
      dbms_output.put_line(roll||' is not detained');
      update stud_main set status='ND' where roll_no=roll;
   end if;
   exception
      when no_data_found then dbms_output.put_line(roll|| 'not found');
end;
/