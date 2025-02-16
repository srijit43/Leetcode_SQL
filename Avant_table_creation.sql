CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(10,2),
    approved_amount DECIMAL(10,2),
    disbursement_date DATE,
    status VARCHAR(20), -- 'active', 'closed', 'default'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    due_date DATE,
    status VARCHAR(20), -- 'on-time', 'late', 'missed'
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

CREATE TABLE loan_applications (
    application_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(10,2),
    application_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);