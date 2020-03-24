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
INSERT INTO Property VALUES (0, 9, 441, NULL, 'Lake Billstad', NULL, 'Singapore', '1987-12-14', 3, 252);
INSERT INTO Property VALUES (2, 16, 113, NULL, 'West Lois', NULL, 'Palestinian Territor', '1971-09-20', 9, 135);
INSERT INTO Property VALUES (3, 59, 761, NULL, 'Lake Tiaraside', NULL, 'Chad', '1972-09-18', 1, 135);
INSERT INTO Property VALUES (4, 45, 109, NULL, 'Collinsberg', NULL, 'Madagascar', '1982-11-10', 3, 252);
INSERT INTO Property VALUES (5, 91, 776, NULL, 'Sigmundberg', NULL, 'Bulgaria', '1986-07-20', 9, 110);
INSERT INTO Property VALUES (6, 26, 983, NULL, 'Lake Leone', NULL, 'Pitcairn Islands', '1982-03-15', 0, 241);
INSERT INTO Property VALUES (7, 84, 948, NULL, 'West Sincere', NULL, 'Hong Kong', '1991-12-19', 6, 241);
INSERT INTO Property VALUES (8, 65, 797, NULL, 'Jakubowskiside', NULL, 'British Indian Ocean', '2010-11-20', 2, 31);
INSERT INTO Property VALUES (9, 100, 546, NULL, 'Lefflerchester', NULL, 'Netherlands Antilles', '2000-02-22', 0, 110);
INSERT INTO Property VALUES (10, 47, 768, NULL, 'Abagailberg', NULL, 'Netherlands', '2014-06-13', 0, 31);