SELECT email
FROM customer
WHERE is_active = 1 NOT IN(SELECT email FROM customer WHERE is_active = 0)