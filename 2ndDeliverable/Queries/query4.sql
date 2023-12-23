SELECT date, number_of_people, comment, customer.firstname AS fisrtname, customer.lastname AS lastname, customer.phone_number AS phone_number
FROM mydb.reservation 
JOIN customer ON customer_id = customer.id
where Table_Store_id = 1 and date="2023-12-22" and Customer_id = 1;