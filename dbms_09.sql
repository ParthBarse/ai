-- Create Branch table
CREATE TABLE Branch (
    branch_name VARCHAR2(50) PRIMARY KEY,
    branch_city VARCHAR2(50) NOT NULL,
    assets NUMBER(10, 2) NOT NULL
);

-- Create Account table
CREATE TABLE Account (
    acc_no NUMBER PRIMARY KEY,
    branch_name VARCHAR2(50) REFERENCES Branch(branch_name),
    balance NUMBER(10, 2) NOT NULL
);

-- Create Customer table
CREATE TABLE Customer (
    cust_name VARCHAR2(50) PRIMARY KEY,
    cust_street VARCHAR2(100),
    cust_city VARCHAR2(50)
);

-- Create Depositor table
CREATE TABLE Depositor (
    cust_name VARCHAR2(50) REFERENCES Customer(cust_name),
    acc_no NUMBER REFERENCES Account(acc_no),
    PRIMARY KEY (cust_name, acc_no)
);

-- Create Loan table
CREATE TABLE Loan (
    loan_no NUMBER PRIMARY KEY,
    branch_name VARCHAR2(50) REFERENCES Branch(branch_name),
    amount NUMBER(10, 2) NOT NULL
);

-- Create Borrower table
CREATE TABLE Borrower (
    cust_name VARCHAR2(50) REFERENCES Customer(cust_name),
    loan_no NUMBER REFERENCES Loan(loan_no),
    PRIMARY KEY (cust_name, loan_no)
);


-- Insert data into the Branch table
INSERT INTO Branch (branch_name, branch_city, assets)
VALUES ('Akurdi', 'Pune', 150000),
       ('Hadapsar', 'Pune', 120000),
       ('Kothrud', 'Pune', 100000);

-- Insert data into the Account table
INSERT INTO Account (acc_no, branch_name, balance)
VALUES (101, 'Akurdi', 15000),
       (102, 'Hadapsar', 20000),
       (103, 'Kothrud', 18000);

-- Insert data into the Customer table
INSERT INTO Customer (cust_name, cust_street, cust_city)
VALUES ('John', '123 Main St', 'Pune'),
       ('Alice', '456 Elm St', 'Pune'),
       ('Bob', '789 Oak St', 'Pune');

-- Insert data into the Depositor table
INSERT INTO Depositor (cust_name, acc_no)
VALUES ('John', 101),
       ('Alice', 102),
       ('Bob', 103);

-- Insert data into the Loan table
INSERT INTO Loan (loan_no, branch_name, amount)
VALUES (201, 'Akurdi', 15000),
       (202, 'Hadapsar', 13000),
       (203, 'Kothrud', 14000);

-- Insert data into the Borrower table
INSERT INTO Borrower (cust_name, loan_no)
VALUES ('John', 201),
       ('Alice', 202),
       ('Bob', 203);

-- Q1 - Find the names of all branches in the loan relation.

SELECT DISTINCT branch_name FROM Loan;

-- Q2. Find all loan numbers for loans made at Akurdi Branch with a loan amount > 12000.

SELECT loan_no
FROM Loan
WHERE branch_name = 'Akurdi' AND amount > 12000;

--Q3. Find all customers who have a loan from the bank. Find their names, loan_no, and loan amount.

SELECT C.cust_name, L.loan_no, L.amount
FROM Customer C
JOIN Borrower B ON C.cust_name = B.cust_name
JOIN Loan L ON B.loan_no = L.loan_no;

-- Q4 List all customers in alphabetical order who have a loan from the Akurdi branch.

SELECT C.cust_name
FROM Customer C
JOIN Borrower B ON C.cust_name = B.cust_name
JOIN Loan L ON B.loan_no = L.loan_no
WHERE L.branch_name = 'Akurdi'
ORDER BY C.cust_name;

-- Q5. Find all customers who have an account or loan or both at the bank.

SELECT cust_name
FROM Customer
WHERE cust_name IN (SELECT cust_name FROM Depositor) OR cust_name IN (SELECT cust_name FROM Borrower);

-- Q6. Find all customers who have both an account and a loan at the bank.

SELECT cust_name
FROM Customer
WHERE cust_name IN (SELECT cust_name FROM Depositor) AND cust_name IN (SELECT cust_name FROM Borrower);

