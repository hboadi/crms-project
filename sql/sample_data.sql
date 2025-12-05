--Fake data for tables in database, made my hand and with assist from AI

--Insert data into student table
insert into student values 
('jxd123', 'John', 'Doe', 'john.doe@example.com', '123-456-7890'), 
('asm456', 'Alice', 'Smith', 'alice.smith@example.com', '234-567-8901'), 
('bkt789', 'Bob', 'Taylor', 'bob.taylor@example.com', '345-678-9012'),
('hxb327', 'Humphrey', 'Boadi', 'hxb327@case.edu', '732-789-0123'),
('cmo80', 'Chiebuka', 'Onyejesi', 'cmo80@case.edu', '567-890-1234'),
('yxw1650', 'Yinghui', 'Wu',  'yxw1650@case.edu', '914-901-2345'),
('zlq25', 'Zheng', 'Li', 'zlq25@case.edu', '862-012-3456'),
('ams123', 'Amina', 'Suleiman', 'ams123@case.edu', '890-123-4567'),
('rvg456', 'Ravi', 'Gupta', 'rvg456@case.edu', '901-234-5678'),
('dah181', 'Darin', 'Hall', 'dah181@case.edu', '216-345-6789'),
('wyt2' , 'Wayzaro', 'Taylor', 'wyt2@case.edu', '123-420-7000'),
('cxg438', 'Cheng', 'Guo', 'cxg438@case.edu', '214-567-8901'),
('sjj567', 'Sarah', 'Johnson', 'sjj567@case.edu', '216-555-0101'),
('mrz890', 'Mike', 'Rodriguez', 'mrz890@case.edu', '216-555-0102'),
('ecn234', 'Emily', 'Chen', 'ecn234@case.edu', '216-555-0103');   

--Insert data into employee table
INSERT INTO employee VALUES 
('EMP001', 'sjj567', 'Sarah', 'Johnson', 'Manager', 'sarah.johnson@case.edu', '216-555-0101'),
('EMP002', 'mrz890', 'Mike', 'Rodriguez', 'Assistant Manager', 'mike.rodriguez@case.edu', '216-555-0102'),
('EMP003', 'ecn234', 'Emily', 'Chen', 'Student Worker', 'emily.chen@case.edu', '216-555-0103'),
('EMP004', 'hxb327', 'Humphrey', 'Boadi', 'Student Worker', 'hxb327@case.edu', '732-789-0123'),
('EMP005', 'cmo80', 'Chiebuka', 'Onyejesi', 'Student Worker', 'cmo80@case.edu', '567-890-1234');

-- Insert data into item table
INSERT INTO item VALUES 
('ITM001', 'MacBook Pro M5', 'Electronics', 3, 1599.00),
('ITM002', 'Dell XPS 13', 'Electronics', 5, 1299.00),
('ITM003', 'Calculator', 'Electronics', 10, 25.99),
('ITM004', 'I-Pad 10th Gen', 'Electronics', 3, 250.00),
('ITM005', 'I-Pad 5th Gen', 'Electronics', 3, 379.00),
('ITM006', 'Vacuum ', 'Cleaning Supplies', 5, 200.00),
('ITM007', 'Swiffer WetJet', 'Cleaning Supplies', 7, 25.00),
('ITM008', 'Large Pot', 'Cooking Supplies', 5, 35.00),
('ITM009', 'Blender', 'Cooking Supplies', 5, 80.00),
('ITM010', 'Medium Frying Pan', 'Cooking Supplies', 3, 35.00),
('ITM011', 'Slow Cooker', 'Cooking Supplies', 1, 50.00),
('ITM012', 'SharkNinja Air Fryer', 'Cooking Supplies', 2, 120.00),
('ITM013', 'Monopoly', 'Board Game', 5, 15.00),
('ITM014', 'The Game of Life', 'Board Game', 3, 20.00), 
('ITM015', 'Soccer Ball', 'Sports Equipment', 2, 450.00),
('ITM016', 'Tennis Racket', 'Sports Equipment', 4, 150.00); 

-- Insert data into item copies table 
INSERT INTO itemcopy VALUES 
-- MacBook Pro M5 (3 units)
('CPY001', 'ITM001', 'MACBOOK-001', 'available', 'excellent'),
('CPY002', 'ITM001', 'MACBOOK-002', 'available', 'good'),
('CPY003', 'ITM001', 'MACBOOK-003', 'available', 'excellent'),

-- Dell XPS 13 (5 units)
('CPY004', 'ITM002', 'DELL-001', 'available', 'excellent'),
('CPY005', 'ITM002', 'DELL-002', 'available', 'good'),
('CPY006', 'ITM002', 'DELL-003', 'available', 'excellent'),
('CPY007', 'ITM002', 'DELL-004', 'available', 'fair'),
('CPY008', 'ITM002', 'DELL-005', 'available', 'excellent'),

-- Calculator (10 units)
('CPY009', 'ITM003', 'CALC-001', 'available', 'excellent'),
('CPY010', 'ITM003', 'CALC-002', 'available', 'good'),
('CPY011', 'ITM003', 'CALC-003', 'available', 'excellent'),
('CPY012', 'ITM003', 'CALC-004', 'available', 'fair'),
('CPY013', 'ITM003', 'CALC-005', 'available', 'excellent'),
('CPY014', 'ITM003', 'CALC-006', 'available', 'good'),
('CPY015', 'ITM003', 'CALC-007', 'available', 'excellent'),
('CPY016', 'ITM003', 'CALC-008', 'available', 'excellent'),
('CPY017', 'ITM003', 'CALC-009', 'available', 'good'),
('CPY018', 'ITM003', 'CALC-010', 'available', 'excellent'),

-- I-Pad 10th Gen (3 units)
('CPY019', 'ITM004', 'IPAD10-001', 'available', 'excellent'),
('CPY020', 'ITM004', 'IPAD10-002', 'available', 'good'),
('CPY021', 'ITM004', 'IPAD10-003', 'available', 'excellent'),

-- I-Pad 5th Gen (3 units)
('CPY022', 'ITM005', 'IPAD5-001', 'available', 'good'),
('CPY023', 'ITM005', 'IPAD5-002', 'available', 'fair'),
('CPY024', 'ITM005', 'IPAD5-003', 'available', 'good'),

-- Vacuum (5 units)
('CPY025', 'ITM006', 'VACUUM-001', 'available', 'excellent'),
('CPY026', 'ITM006', 'VACUUM-002', 'available', 'good'),
('CPY027', 'ITM006', 'VACUUM-003', 'available', 'fair'),
('CPY028', 'ITM006', 'VACUUM-004', 'available', 'excellent'),
('CPY029', 'ITM006', 'VACUUM-005', 'available', 'good'),

-- Swiffer WetJet (7 units)
('CPY030', 'ITM007', 'SWIFFER-001', 'available', 'excellent'),
('CPY031', 'ITM007', 'SWIFFER-002', 'available', 'good'),
('CPY032', 'ITM007', 'SWIFFER-003', 'available', 'excellent'),
('CPY033', 'ITM007', 'SWIFFER-004', 'available', 'good'),
('CPY034', 'ITM007', 'SWIFFER-005', 'available', 'fair'),
('CPY035', 'ITM007', 'SWIFFER-006', 'available', 'excellent'),
('CPY036', 'ITM007', 'SWIFFER-007', 'available', 'good'),

-- Large Pot (5 units)
('CPY037', 'ITM008', 'POT-001', 'available', 'excellent'),
('CPY038', 'ITM008', 'POT-002', 'available', 'good'),
('CPY039', 'ITM008', 'POT-003', 'available', 'excellent'),
('CPY040', 'ITM008', 'POT-004', 'available', 'fair'),
('CPY041', 'ITM008', 'POT-005', 'available', 'excellent'),

-- Blender (5 units)
('CPY042', 'ITM009', 'BLENDER-001', 'available', 'excellent'),
('CPY043', 'ITM009', 'BLENDER-002', 'available', 'good'),
('CPY044', 'ITM009', 'BLENDER-003', 'available', 'excellent'),
('CPY045', 'ITM009', 'BLENDER-004', 'available', 'fair'),
('CPY046', 'ITM009', 'BLENDER-005', 'available', 'excellent'),

-- Medium Frying Pan (3 units)
('CPY047', 'ITM010', 'PAN-001', 'available', 'excellent'),
('CPY048', 'ITM010', 'PAN-002', 'available', 'good'),
('CPY049', 'ITM010', 'PAN-003', 'available', 'excellent'),

-- Slow Cooker (1 unit)
('CPY050', 'ITM011', 'SLOWCOOK-001', 'available', 'excellent'),

-- SharkNinja Air Fryer (2 units)
('CPY051', 'ITM012', 'AIRFRYER-001', 'available', 'excellent'),
('CPY052', 'ITM012', 'AIRFRYER-002', 'available', 'good'),

-- Monopoly (5 units)
('CPY053', 'ITM013', 'MONOPOLY-001', 'available', 'excellent'),
('CPY054', 'ITM013', 'MONOPOLY-002', 'available', 'good'),
('CPY055', 'ITM013', 'MONOPOLY-003', 'available', 'fair'),
('CPY056', 'ITM013', 'MONOPOLY-004', 'available', 'excellent'),
('CPY057', 'ITM013', 'MONOPOLY-005', 'available', 'good'),

-- The Game of Life (3 units)
('CPY058', 'ITM014', 'LIFE-001', 'available', 'excellent'),
('CPY059', 'ITM014', 'LIFE-002', 'available', 'good'),
('CPY060', 'ITM014', 'LIFE-003', 'available', 'excellent'),

-- Soccer Ball (2 units)
('CPY061', 'ITM015', 'SOCCER-001', 'available', 'excellent'),
('CPY062', 'ITM015', 'SOCCER-002', 'available', 'good'),

-- Tennis Racket (4 units)
('CPY063', 'ITM016', 'TENNIS-001', 'available', 'excellent'),
('CPY064', 'ITM016', 'TENNIS-002', 'available', 'good'),
('CPY065', 'ITM016', 'TENNIS-003', 'available', 'excellent'),
('CPY066', 'ITM016', 'TENNIS-004', 'available', 'fair');

-- Insert data into rental table
insert into rental values 
('RNT001', 'ITM001', 'MacBook Pro M5', 'jxd123', 'EMP001', 'active', date('2024-06-01'), date('2024-06-08')),
('RNT002', 'ITM003', 'Calculator', 'asm456', 'EMP002', 'active', date('2024-06-03'), date('2024-06-10')),
('RNT003', 'ITM007', 'Swiffer WetJet', 'bkt789', 'EMP003', 'active', date('2024-06-05'), date('2024-06-12'));

update itemcopy set status = 'checked out' where copy_id in ('CPY001', 'CPY009', 'CPY030');

-- Insert data into return table
insert into return values
('RTN001', 'RNT001', date('2024-06-07'), 'good', 'EMP004');

update rental set status = 'returned' where rental_id = 'RNT001';