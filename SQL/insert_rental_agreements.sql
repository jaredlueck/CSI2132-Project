/* Rental_Agreement (
	agreement_id int PK, 
	sign_date date,
	start_date date,	
	end_date date,
	host_id int FK,
	guest_id int FK, 
	property_id int FK,
	
); */

INSERT INTO Rental_Agreement VALUES (1, '2019-10-17', '2019-10-20', '2019-12-20', 2, 5, 1);
INSERT INTO Rental_Agreement VALUES (2, '2019-11-17', '2019-11-20', '2019-11-25', 1, 7, 4);