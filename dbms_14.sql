CREATE TABLE Stud (
   Roll NUMBER PRIMARY KEY,
   Att NUMBER,
   Status VARCHAR2(2)
);

INSERT INTO Stud (Roll, Att, Status)
VALUES (101, 80, 'ND');

INSERT INTO Stud (Roll, Att, Status)
VALUES (102, 70, 'D');

INSERT INTO Stud (Roll, Att, Status)
VALUES (103, 90, 'ND');

SET SERVEROUTPUT ON;

DECLARE
   v_roll_number;
   v_attendance;
BEGIN
   v_roll_number := &roll_number;

   SELECT Att INTO v_attendance
   FROM Stud
   WHERE Roll = v_roll_number;

   IF (v_attendance < 75) THEN
      DBMS_OUTPUT.PUT_LINE('Term not granted');
      UPDATE Stud
      SET Status = 'D'
      WHERE Roll = v_roll_number;
   ELSE
      DBMS_OUTPUT.PUT_LINE('Term granted');
      UPDATE Stud
      SET Status = 'ND'
      WHERE Roll = v_roll_number;
   END IF;
   
   COMMIT;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Roll number not found.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
