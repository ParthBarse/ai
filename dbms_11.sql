-- Q1. Find the branches where average account balance > 12000.

select branch_name from account
group by (branch_name)
having AVG(balance) > 12000;

-- Q2. Find number of tuples in customer relation.

select count(*) from customer;

-- Q3. Calculate total loan amount given by bank.

select SUM(amount) from loan;

-- Q4. Delete all loans with loan amount between 1300 and 1500.

DELETE FROM Borrower
WHERE loan_no IN (
    SELECT loan_no
    FROM Loan
    WHERE amount BETWEEN 1300 AND 1500
);
DELETE FROM Loan
WHERE amount BETWEEN 1300 AND 1500;
