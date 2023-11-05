-- a. Create following Tables cust_mstr(cust_no,fname,lname) add_dets_main(code_no,add1,add2,state,city,pincode) Retrieve the address of customer Fname as 'Ramesh' and Lname as 'Shinde'

-- Create cust_mstr_main table
CREATE TABLE cust_mstr_main (
  cust_no NUMBER PRIMARY KEY,
  fname VARCHAR2(50),
  lname VARCHAR2(50)
);

-- Create add_dets_main table
CREATE TABLE add_dets_main (
  code_no NUMBER PRIMARY KEY,
  add1 VARCHAR2(100),
  add2 VARCHAR2(100),
  state VARCHAR2(50),
  city VARCHAR2(50),
  pincode NUMBER
);

-- Insert sample data
INSERT INTO cust_mstr_main (cust_no, fname, lname) VALUES (1, 'Ramesh', 'Shinde');

INSERT INTO add_dets_main (code_no, add1, add2, state, city, pincode)
VALUES (1, '123 Main St', 'Apt 4B', 'CA', 'Los Angeles', 90001);

-- Retrieve the address of 'Ramesh Shinde'
SELECT a.add1, a.add2, a.state, a.city, a.pincode
FROM cust_mstr_main c
JOIN add_dets_main a ON c.cust_no = code_no
WHERE c.fname = 'Ramesh' AND c.lname = 'Shinde';

-- b.Create following Tables cust_mstr(custno,fname,lname) acc_fd_cust_dets_main(codeno,acc_fd_no) fd_dets_main(fd_sr_no,amt) List the customer holding fixed deposit of amount more than 5000

CREATE TABLE acc_fd_cust_dets_main (
  codeno NUMBER PRIMARY KEY,
  acc_fd_no NUMBER
);

CREATE TABLE fd_dets_main (
  fd_sr_no NUMBER PRIMARY KEY,
  amt NUMBER
);

CREATE TABLE cust_mstr_main (
  cust_no NUMBER PRIMARY KEY,
  fname VARCHAR2(50),
  lname VARCHAR2(50)
);


INSERT INTO acc_fd_cust_dets_main (codeno, acc_fd_no) VALUES (1, 1001);
INSERT INTO acc_fd_cust_dets_main (codeno, acc_fd_no) VALUES (2, 1002);
INSERT INTO acc_fd_cust_dets_main (codeno, acc_fd_no) VALUES (3, 1003);

INSERT INTO fd_dets_main (fd_sr_no, amt) VALUES (1, 6000);
INSERT INTO fd_dets_main (fd_sr_no, amt) VALUES (2, 4500);
INSERT INTO fd_dets_main (fd_sr_no, amt) VALUES (1003, 7000);

INSERT INTO cust_mstr_main (cust_no, fname, lname) VALUES (1, 'John', 'Doe');
INSERT INTO cust_mstr_main (cust_no, fname, lname) VALUES (2, 'Jane', 'Smith');
INSERT INTO cust_mstr_main (cust_no, fname, lname) VALUES (3, 'Alice', 'Johnson');


SELECT cm.cust_no, cm.fname, cm.lname
FROM cust_mstr_main cm
JOIN acc_fd_cust_dets_main acd ON cm.cust_no = acd.codeno
JOIN fd_dets_main fd ON acd.acc_fd_no = fd.fd_sr_no
WHERE fd.amt > 5000;

-- c. Create following Tables emp_mstr(e_mpno,f_name,l_name,m_name,dept,desg,branch_no) branch_mstr(name,b_no) List the employee details along with branch names to which they belong

CREATE TABLE emp_mstr_main (
e_mpno INT PRIMARY KEY,
f_name VARCHAR(20),
l_name VARCHAR(20),
m_name VARCHAR(20),
dept VARCHAR(20),
desg VARCHAR(20),
branch_no INT
);

CREATE TABLE branch_mstr_main (
name VARCHAR(20),
b_no INT PRIMARY KEY
);

-- Insert sample data into emp_mstr_main
INSERT INTO emp_mstr_main (e_mpno, f_name, l_name, m_name, dept, desg, branch_no)
VALUES (1, 'John', 'Doe', 'M', 'HR', 'Manager', 101);
INSERT INTO emp_mstr_main (e_mpno, f_name, l_name, m_name, dept, desg, branch_no)
VALUES (2, 'Jane', 'Smith', 'A', 'Finance', 'Analyst', 102);
INSERT INTO emp_mstr_main (e_mpno, f_name, l_name, m_name, dept, desg, branch_no)
VALUES (3, 'Alice', 'Johnson', 'B', 'IT', 'Developer', 103);

-- Insert sample data into branch_mstr_main
INSERT INTO branch_mstr_main (name, b_no)
VALUES ('Los Angeles', 101);
INSERT INTO branch_mstr_main (name, b_no)
VALUES ('New York', 102);
INSERT INTO branch_mstr_main (name, b_no)
VALUES ('San Francisco', 103);


select e.f_name, e.l_name, e.e_mpno, e.dept, e.desg, b.name
from emp_mstr_main e
join branch_mstr_main b on e.branch_no=b.b_no;