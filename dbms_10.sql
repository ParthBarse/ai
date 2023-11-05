-- Q1. Find all customers who have both account and loan at the bank.

SELECT D.cust_name
FROM Depositor D
JOIN Borrower B ON D.cust_name = B.cust_name;

-- OR

select cust_name from customer
where cust_name in (select cust_name from depositor) and cust_name in (select cust_name from borrower);


-- Q2. Find all customers who have an account but no loan at the bank.

SELECT D.cust_name
FROM Depositor D
LEFT JOIN Borrower B ON D.cust_name = B.cust_name
WHERE B.cust_name IS NULL;

-- OR

select cust_name from customer
where cust_name in (select cust_name from depositor) and cust_name not
in (select cust_name from borrower);

-- Q3. Find average account balance at Akurdi branch.

select AVG(balance) from account
where branch_name = 'Akurdi';

-- Q4. Find the average account balance at each branch

select AVG(balance), branch_name from account
group by(branch_name);

-- Q5. Find no. of depositors at each branch

select branch_name,count(*) from account
group by (branch_name);

