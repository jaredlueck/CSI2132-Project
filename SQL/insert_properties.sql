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

INSERT INTO Property VALUES (1, 65, 55, 'Deighton cresent', 'Ottawa', 'Ontario', 'Canada', 2, 2);
INSERT INTO Property VALUES (0, 9, 441, 'Locheland drive', 'Lake Billstad', 'Michigan', 'Singapore', 3, 252);
INSERT INTO Property VALUES (2, 16, 113, 'Longfields drive', 'West Lois', 'Quebec', 'Palestinian Territor', 9, 135);
INSERT INTO Property VALUES (3, NULL, 761, 'Main street', 'Lake Tiaraside', 'Yukon', 'Chad', 1, 135);
INSERT INTO Property VALUES (4, 45, 109, 'Second street', 'Collinsberg', 'Missouri', 'Madagascar',  3, 252);
INSERT INTO Property VALUES (5, 91, 776, 'Maybrooke avenue', 'Sigmundberg', 'Georgia', 'Bulgaria',  9, 110);
INSERT INTO Property VALUES (6, NULL, 983, 'Somerset avenue', 'Lake Leone', 'Ontario', 'Pitcairn Islands',  0, 241);
INSERT INTO Property VALUES (7, 84, 948, 'Laurier avenue', 'West Sincere', 'California', 'Hong Kong',  6, 241);
INSERT INTO Property VALUES (8, 65, 797, 'West Hunt club', 'Jakubowskiside', 'Ontario', 'British Indian Ocean', 2, 31);
INSERT INTO Property VALUES (9, NULL, 546, 'Petersburg drive', 'Lefflerchester', 'Alberta', 'Netherlands Antilles',  0, 110);
INSERT INTO Property VALUES (10, 47, 768, 'Rodeo drive', 'first street', 'Saskatchwan', 'Netherlands',  3, 31);

INSERT INTO Property VALUES (11, NULL, 768, 'Longfields drive', 'bay drive', 'Saskatchwan', 'Netherlands',  7, 31);
INSERT INTO Property VALUES (12, NULL, 78, 'Malvern drive', 'Laurier evenue', 'Saskatchwan', 'Netherlands',  2, 31);
INSERT INTO Property VALUES (13, NULL, 707, 'Woodroffe ave', 'Jakubowskiside', 'Ontario', 'British Indian Ocean', 2, 2);
INSERT INTO Property VALUES (14, NULL, 5, 'Soho drive', 'Lefflerchester', 'Alberta', 'Netherlands Antilles',  0, 110);
INSERT INTO Property VALUES (15, NULL, 6, 'Halley drive', 'Lake Leone', 'Ontario', 'Pitcairn Islands',  0, 241);
