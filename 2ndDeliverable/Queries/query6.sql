SELECT menu_item.name AS Menu_item, menu_item.description AS Description, menu_item.price As Price, menu.name AS Menu, menu.description AS Menu_description 
FROM menu_item
cross join menu
where menu_item.Menu_id = menu.id and menu.Store_id = 1;