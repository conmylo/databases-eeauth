SELECT reservation.number_of_people AS Number_of_people, reservation.date AS Date, reservation.comment AS comment, reservation.time_slot AS Time_slot, notification.created_at AS Created_at, notification.notification_type AS Notification_Type, customer.firstname AS Firstname, customer.lastname AS Lastname, customer.email AS EMAIL, customer.phone_number AS Phone_number
from customer JOIN reservation 	ON customer.id = reservation.customer_id
	JOIN notification ON reservation.id = notification.Reservation_id
	JOIN mydb.table ON mydb.table.id = reservation.Table_id
    JOIN store ON mydb.table.Store_id = store.id
WHERE customer.id = 1 and mydb.table.id = 1 and store.id = 1