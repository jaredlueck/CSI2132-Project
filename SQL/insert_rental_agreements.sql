/* Rental_Agreement (
	agreement_id int PK, 
	sign_date date,
	start_date date,	
	end_date date,
	host_id int FK,
	guest_id int FK, 
	property_id int FK,
	
); */

INSERT INTO Rental_Agreement VALUES (0, '2007-04-29', '2007-04-30', '2007-05-01', 241, 422, 9);
INSERT INTO Rental_Agreement VALUES (1, '2011-02-28', '2011-03-10', '2011-03-27', 252, 450, 10);
INSERT INTO Rental_Agreement VALUES (2, '2012-05-09', '2012-05-10', '2012-06-02', 31, 450, 0);
INSERT INTO Rental_Agreement VALUES (3, '2011-10-15', '2011-10-20', '2011-10-25', 110, 393, 7);
INSERT INTO Rental_Agreement VALUES (4, '2019-11-10', '2019-11-12', '2019-11-14', 135, 400, 8);
INSERT INTO Rental_Agreement VALUES (6, '2019-11-13', '2019-03-23', '2019-12-29', 252, 300, 5);
INSERT INTO Rental_Agreement VALUES (7, '2015-10-20', '2015-11-28', '2015-12-29', 31, 300, 6);

