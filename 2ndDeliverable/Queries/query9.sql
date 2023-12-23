SELECT C1.name AS duplicate_name, C1.id AS Menu, store.name AS Store
FROM Menu C1
JOIN store ON C1.store_id = store.id
JOIN Menu C2 ON C1.name = C2.name AND C1.store_id = C2.store_id and C1.id <> C2.id
WHERE store.id = 1;
