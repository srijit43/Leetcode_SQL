-- Create the Customers table with _aws suffix
/*CREATE TABLE Customers_aws (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

-- Insert data into the Customers_aws table
INSERT INTO Customers_aws (customer_id, customer_name, email)
VALUES
    (1, 'Alice', 'alice@leetcode.com'),
    (2, 'Bob', 'bob@leetcode.com'),
    (13, 'John', 'john@leetcode.com'),
    (6, 'Alex', 'alex@leetcode.com');

-- Create the Contacts table with _aws suffix
CREATE TABLE Contacts_aws (
    user_id INT,
    contact_name VARCHAR(50),
    contact_email VARCHAR(100),
    PRIMARY KEY (user_id, contact_email)
);

-- Insert data into the Contacts_aws table
INSERT INTO Contacts_aws (user_id, contact_name, contact_email)
VALUES
    (1, 'Bob', 'bob@leetcode.com'),
    (1, 'John', 'john@leetcode.com'),
    (1, 'Jal', 'jal@leetcode.com'),
    (2, 'Omar', 'omar@leetcode.com'),
    (2, 'Meir', 'meir@leetcode.com'),
    (6, 'Alice', 'alice@leetcode.com');

-- Create the Invoices table with _aws suffix
CREATE TABLE Invoices_aws (
    invoice_id INT PRIMARY KEY,
    price DECIMAL(10, 2),
    user_id INT
);

-- Insert data into the Invoices_aws table
INSERT INTO Invoices_aws (invoice_id, price, user_id)
VALUES
    (77, 100.00, 1),
    (88, 200.00, 1),
    (99, 300.00, 2),
    (66, 400.00, 2),
    (55, 500.00, 13),
    (44, 60.00, 6);
*/

/*
Write an SQL query to find the following for each invoice_id:

customer_name: The name of the customer the invoice is related to.
price: The price of the invoice.
contacts_cnt: The number of contacts related to the customer.
trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. (i.e His/Her email exists in the Customers table.)
Order the result table by invoice_id.

*/

-- Select * from customers_aws
-- Select * from contacts_aws
-- Select * from invoices_aws

select invoice_id , c0.customer_name, price, 
    count(c1.contact_email) as contacts_cnt, 
    count(c2.email) as trusted_contacts_cnt
from invoices_aws i 
inner join customers_aws c0 on i.user_id = c0.customer_id
left outer join contacts_aws c1 on c0.customer_id = c1.user_id
left outer join customers_aws c2 on c2.email = c1.contact_email
group by invoice_id , c0.customer_name , price
order by invoice_id


