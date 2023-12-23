SELECT store.name AS Name, store.address AS addres, store.ZIP AS ZIP, store.city AS city, store.phone_number AS Phone_number, store.email AS Email, store.store_type AS Type
FROM mydb.evaluates 
JOIN store ON store_id = store.id
WHERE number_of_stars = 4;