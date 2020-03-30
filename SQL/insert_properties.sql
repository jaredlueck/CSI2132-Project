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
INSERT INTO Property VALUES (0, 9, 441, 'Locheland drive', 'Lake Billstad', 'Michigan', 'Singapore', '1987-12-14', 3, 252);
INSERT INTO Property VALUES (2, 16, 113, 'Longfields drive', 'West Lois', 'Quebec', 'Palestinian Territor', '1971-09-20', 9, 135);
INSERT INTO Property VALUES (3, 59, 761, 'Main street', 'Lake Tiaraside', 'Yukon', 'Chad', '1972-09-18', 1, 135);
INSERT INTO Property VALUES (4, 45, 109, 'Second street', 'Collinsberg', 'Missouri', 'Madagascar', '1982-11-10', 3, 252);
INSERT INTO Property VALUES (5, 91, 776, 'Maybrooke avenue', 'Sigmundberg', 'Georgia', 'Bulgaria', '1986-07-20', 9, 110);
INSERT INTO Property VALUES (6, 26, 983, 'Somerset avenue', 'Lake Leone', 'Ontario', 'Pitcairn Islands', '1982-03-15', 0, 241);
INSERT INTO Property VALUES (7, 84, 948, 'Laurier avenue', 'West Sincere', 'California', 'Hong Kong', '1991-12-19', 6, 241);
INSERT INTO Property VALUES (8, 65, 797, 'West junt club', 'Jakubowskiside', 'Ontario', 'British Indian Ocean', '2010-11-20', 2, 31);
INSERT INTO Property VALUES (9, 100, 546, 'Petersburg drive', 'Lefflerchester', 'Alberta', 'Netherlands Antilles', '2000-02-22', 0, 110);
INSERT INTO Property VALUES (10, 47, 768, 'Rodeo drive', 'Abagailberg', 'Saskatchwan', 'Netherlands', '2014-06-13', 0, 31);
