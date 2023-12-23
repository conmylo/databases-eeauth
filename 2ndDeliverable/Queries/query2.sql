SELECT name, address, ZIP, city, email, phone_number, store_type AS Type 
FROM mydb.store
where store_type = 'restaurant' or store_type='cafe';