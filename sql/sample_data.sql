--Fake data for tables in database, made my hand and with assist from Ai

--Insert data into student table
insert into student values 
('jxd123', 'John', 'Doe', 'john.doe@example.com', '123-456-7890'), 
('asm456', 'Alice', 'Smith', 'alice.smith@example.com', '234-567-8901'), 
('bkt789', 'Bob', 'Taylor', 'bob.taylor@example.com', '345-678-9012'),
('hxb327', 'Humphrey', 'Boadi', 'hxb327@case.edu', '456-789-0123');   

--Insert data into employee table
INSERT INTO employee VALUES 
('EMP001', 'STU001', 'John', 'Doe', 'Manager', 'john.doe@email.com', '555-0101'),
('EMP002', 'STU002', 'Jane', 'Smith', 'Assistant', 'jane.smith@email.com', '555-0102');

-- Insert data into item table
INSERT INTO item VALUES 
('ITM001', 'Laptop', 'Electronics', 10, 1200.00),
('ITM002', 'Calculator', 'Electronics', 50, 25.99),
('ITM003', 'Textbook', 'Books', 30, 89.50);

-- Insert data into item copies table
INSERT INTO itemcopy VALUES 
('CPY001', 'ITM001', 'LAPTOP-001', 'available', 'excellent'),
('CPY002', 'ITM001', 'LAPTOP-002', 'rented', 'good'),
('CPY003', 'ITM002', 'CALC-001', 'available', 'excellent');

-- Insert sample rentals
INSERT INTO rental VALUES 
('REN001', 'ITM001', 'STU003', 'EMP001', 'active', current_date, current_date + interval '5 days'),
('REN002', 'ITM002', 'STU002', 'EMP002', 'returned', current_date - interval '10 days', current_date - interval '5 days');