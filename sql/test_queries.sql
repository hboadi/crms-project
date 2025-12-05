--Test Queries for CRMS Database to ensure correctness of schema c

-- Test 1: Retrieve all items sorted by category and price (like organizing items by size and color)
SELECT item_name, category, price  
FROM item 
ORDER BY category, price;

-- Test 2: Current active rentals with renter details
SELECT 
    r.rental_id,
    s.first_name || ' ' || s.last_name AS renter_name,
    i.item_name,
    r.checkout_date,
    r.due_date,
    CASE 
        WHEN r.due_date < date('now') THEN 'OVERDUE'
        WHEN r.due_date = date('now') THEN 'DUE TODAY'
        ELSE 'OK'
    END as status_check
FROM rental r
JOIN student s ON r.renter_case_id = s.case_id
JOIN item i ON r.item_id = i.item_id
WHERE r.status = 'active'
ORDER BY r.due_date;

-- Test 3: Recent returns with details (similar to active rentals)
SELECT 
    rt.return_id,
    s.first_name || ' ' || s.last_name AS returner_name,
    r.item_name,
    r.checkout_date,
    r.due_date,
    rt.return_date,
    CASE 
        WHEN rt.return_date > r.due_date THEN 'RETURNED LATE'
        WHEN rt.return_date <= r.due_date THEN 'RETURNED ON TIME'
    END as return_status,
    rt.condition_on_return,
    e.first_name || ' ' || e.last_name AS processed_by_employee
FROM return rt
JOIN rental r ON rt.rental_id = r.rental_id
JOIN student s ON r.renter_case_id = s.case_id
JOIN employee e ON rt.employee_id = e.employee_id
ORDER BY rt.return_date DESC;

