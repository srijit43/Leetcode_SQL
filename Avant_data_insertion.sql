-- Insert into customers
INSERT INTO customers (customer_id, customer_name, email, phone) VALUES
(1, 'John Doe', 'john.doe@email.com', '123-456-7890'),
(2, 'Alice Smith', 'alice.smith@email.com', '234-567-8901'),
(3, 'Bob Johnson', 'bob.johnson@email.com', '345-678-9012');

-- Insert into loans
INSERT INTO loans (loan_id, customer_id, loan_amount, approved_amount, disbursement_date, status) VALUES
(101, 1, 10000, 10000, '2024-01-15', 'active'),
(102, 1, 5000, 5000, '2024-02-10', 'closed'),
(103, 2, 8000, 7500, '2024-03-05', 'active'),
(104, 3, 15000, 15000, '2024-04-20', 'default');

-- Insert into payments
INSERT INTO payments (payment_id, loan_id, payment_date, amount_paid, due_date, status) VALUES
(1001, 101, '2024-02-15', 2000, '2024-02-10', 'late'),
(1002, 101, '2024-03-15', 3000, '2024-03-10', 'on-time'),
(1003, 101, '2024-04-15', 5000, '2024-04-10', 'on-time'),
(1004, 102, '2024-02-20', 5000, '2024-02-15', 'on-time'),
(1005, 103, '2024-04-01', 4000, '2024-03-30', 'late');

-- Insert into loan_applications
INSERT INTO loan_applications (application_id, customer_id, loan_amount, application_date) VALUES
(201, 1, 5000, '2023-12-01'),
(202, 1, 5000, '2023-12-20'),
(203, 2, 8000, '2024-02-05'),
(204, 3, 15000, '2024-03-15');
