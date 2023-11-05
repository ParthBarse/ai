-- a) Create View on Account table by selecting any two columns and perform insert update delete operations

-- Create a simple view on the Account table with two columns.
CREATE VIEW AccountView AS
SELECT acc_no, balance
FROM Account;

-- You can now perform DML operations on this view like it's a regular table.
-- For example, you can insert a new record:
INSERT INTO AccountView (acc_no, balance) VALUES (1001, 5000);

-- Update a record in the view:
UPDATE AccountView
SET balance = 6000
WHERE acc_no = 1001;

-- Delete a record from the view:
DELETE FROM AccountView
WHERE acc_no = 1001;

-- b) Create view on Account and Branch table by selecting any one column from each table perform insert update delete operations

create view acc_and_brnch as
select a.acc_no, b.branch_name
from acc a
join brnch b on b.branch_name=a.branch_name;

update acc_and_brnch
set acc_no = 105
where branvh_name='Akurdi';
where branvh_name='Akurdi'

delete from acc_and_brnch
where acc_no=105;

-- c) create updateable view on Account table by selecting any two columns and perform insert update delete operations
