/*Payment (
	transaction_id int PK,
	transaction_type varchar(20),
	amount float,
	status varchar(20),
	host_id int,
	guest_id int FK,
	property_id int FK,
); */

INSERT INTO Payment VALUES (0, 'Cash', 43.45, 'pending', 241, 422, 9);
INSERT INTO Payment VALUES (1, 'Credit Card', 54.65, 'approved',  252, 450, 10);
INSERT INTO Payment VALUES (2, 'Check', 30.14, 'completed', 31, 450, 0);
INSERT INTO Payment VALUES (3, 'Direct Debit', 34.45, 'completed', 110, 393, 7);
INSERT INTO Payment VALUES (4, 'Cash', 123.45, 'pending', 135, 7, 3);
INSERT INTO Payment VALUES (5, 'Cash', 90.45, 'approved', 252, 300, 5);
INSERT INTO Payment VALUES (6, 'Cash', 23.45, 'pending', 110, 393, 2);
INSERT INTO Payment VALUES (7, 'Direct Debit', 34.67, 'approved', 241, 422, 9);
INSERT INTO Payment VALUES (8, 'Cash', 590.00, 'completed', 31, 300, 6);
INSERT INTO Payment VALUES (10, 'Cash', 700.12, 'approved', 252, 450, 10);