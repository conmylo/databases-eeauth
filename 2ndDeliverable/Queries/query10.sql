SELECT mydb.table.id, capacity, status, Store_id, date, number_of_people, comment, time_slot
FROM mydb.table
LEFT JOIN reservation ON mydb.table.id = reservation.Table_id
where store_id = 2;