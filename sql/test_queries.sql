--Test Queries for CRMS Database to ensure correctness of schema c

SELECT item_name, category, price  
FROM item 
ORDER BY category, price;

-- Test 1: Count items by category (like counting shirt sizes)
SELECT category, COUNT(*) as item_count
FROM item
GROUP BY category
ORDER BY item_count DESC;

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