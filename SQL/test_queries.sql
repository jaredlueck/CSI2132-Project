/* Test Query 1 */

SELECT firstname, PR.property_type, PR.rate, sign_date, G.country, transaction_type, status FROM Rental_Agreement RA 
	inner join Property Prop
		on Prop.property_id = RA.property_id
	inner join Guest G 
		on G.guest_id = RA.guest_id 
	inner join Pricing Pri
		on Pri.property_id = RA.property_id 
	inner join Pricing PR
		on PR.property_id = RA.property_id
	inner join Payment PA
		on PA.host_id = RA.host_id and PA.guest_id = RA.guest_id 
		and PA.property_id = RA.property_id
	order by transaction_type asc, sign_date desc 
		
/* Test Query 2 */

CREATE VIEW GuestListView AS 
SELECT * FROM Guest 
ORDER country, guest_id

/* Test Query 3 */

WITH pricing_info AS (SELECT RA.sign_date, RA.start_date, RA.end_date, PRI.rate, PRI.property_type, PRO.property_id, RA.guest_id, RA.host_id FROM Rental_Agreement RA
	inner join Property PRO
		on PRO.property_id = RA.property_id
	inner join Pricing PRI
		on PRI.property_id = RA.property_id )

SELECT * FROM pricing_info PI 
WHERE PI.rate = (SELECT MIN(rate) FROM pricing_info) AND
PI.end_date < DATE("now")

/* Test Query 4 */

SELECT * FROM Rental_Agreement RA
	INNER JOIN Property PRO
		ON PRO.property_id = RA.property_id 
	INNER JOIN ( SELECT property_id, 
		AVG(communication + checkin + cleanliness + location)/4 AS rating
		FROM Review 
		GROUP BY property_id) RAT
		ON RAT.property_id =  RA.property_id
	ORDER BY country, rating DESC

/* Test Query 5 */

SELECT DISTINCT * FROM Property PRO
	WHERE NOT EXISTS (SELECT * 
						FROM Rental_Agreement RA
						WHERE RA.property_id = PRO.property_id)

/* Test Query 6 */

SELECT * FROM Rental_Agreement RA 
	INNER JOIN Property PRO
		ON  PRO.property_id = RA.property_id
	WHERE julianday(RA.start_date) 
					- julianday(RA.start_date, 'start of month') + 1 = 10


/* Test Query 7 */

SELECT * FROM Employee E
	LEFT OUTER JOIN Manager M 
		ON E.employee_id = M.manager_id
	ORDER BY manager_id DESC, employee_id DESC
	
/* Test Query 8 */

SELECT property_type, H.firstname as host_name, H.unit_number as street_number, H.street, amount, transaction_type  FROM Property PRO 
	INNER JOIN Payment PA	
		ON PA.property_id = PRO.property_id
	INNER JOIN Host 
		ON H.host_id = PA.host_id
	
/* Test Query 9 */

UPDATE Phonenumber 
SET phone_number = '111-111-1111'
WHERE phone_number = '555-555-5555'

/* Test Query 10 */



