/*
Host (
	guest_id int PK FK,
	email_address varchar(50) not null,
	unit_number int,
	street_number int,
	street varchar(20),
	city varchar(20) not null,
	province varchar(20) not null,
	country varchar(20) not null,
	firstname varchar(20) not null,
	middlename varchar(20),
	lastname varchar(20) not null,
); */

INSERT INTO Host VALUES (1, 'jared.lueck@gmail.com', 1, 1, 'first street', 'Ottawa', 'Ontario', 'Canada', 'Jared', NULL, 'Lueck');
INSERT INTO Host VALUES (2, 'john.lueck@gmail.com', 2, 2, 'second street', 'Ottawa', 'Ontario', 'Canada', 'John', NULL, 'Lueck');
INSERT INTO Host VALUES (3, 'ben.baker@gmail.com', 3, 6, 'third street','Ottawa', 'Ontario', 'Canada', 'Ben', NULL, 'Baker');
INSERT INTO Host VALUES (31, 'aurore.little@example.com', 536, 296, 'facere', 'New Blair', 'asperiores', 'British Indian Ocean', 'Kirsten', 'in', 'Romaguera');
INSERT INTO Host VALUES (110, 'juanita.luettgen@example.com', 641, 431, 'quia', 'Huelland', 'fugit', 'Bulgaria', 'Jacinthe', 'ipsa', 'Schmitt');
INSERT INTO Host VALUES (135, 'dasia69@example.com', 417, 147, 'ut', 'Rosemarieport', 'molestiae', 'Chad', 'Glenna', 'perspiciatis', 'Hyatt');
INSERT INTO Host VALUES (241, 'willow.stracke@example.org', 787, 238, 'voluptatibus', 'West Cameron', 'rem', 'Hong Kong', 'Ashleigh', 'magni', 'Wuckert');
INSERT INTO Host VALUES (252, 'jasper.yundt@example.com', 476, 208, 'rerum', 'South Ricoport', 'ullam', 'Madagascar', 'Darwin', 'et', 'Huel');

