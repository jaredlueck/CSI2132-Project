/* Property (
	property_id int PK,
	unit_number int, 
	street_number int,
	city varchar(20),
	province varchar(20),
	country varchar(20) FK,
	available_date date,
	beds_number int,
	host_id int FK, 
	
); */

INSERT INTO Property VALUES (1, 65, 55, 'Deighton cresent', 'Ottawa', 'Ontario', 'Canada', '2010-10-17', 2, 2);
INSERT INTO Property VALUES (2, 23, 43, 'Tartan drive', 'Ottawa', 'Ontario', 'Canada', '2010-10-17', 1, 1);
INSERT INTO Property VALUES (3, 1, 1, 'Maybrook avenue', 'Toronto', 'Ontario', 'Canada', '2010-10-17', 4, 3);
INSERT INTO Property VALUES (4, 1, 1, 'Rodeo drive', 'Ottawa', 'Ontario', 'Canada', '2010-10-17', 5, 1);
