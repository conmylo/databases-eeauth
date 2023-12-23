SELECT comment, number_of_stars, store.name AS Name
FROM mydb.evaluates e1
JOIN store ON store_id = store.id 
WHERE store_id = 1 and NOT EXISTS (
SELECT 1
  FROM mydb.evaluates e2
  WHERE e2.store_id = e1.store_id
    AND e2.number_of_stars < e1.number_of_stars
);
