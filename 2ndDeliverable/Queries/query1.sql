SELECT name, address, ZIP, city, email, phone_number, store_type as Type
FROM mydb.store
where store_type = 'restaurant';