import sqlite3
conn = sqlite3.connect('RentalSystem.db')

cur = conn.cursor()

with open('../SQL/schema.sql') as fp:
    cur.executescript(fp.read()) 

users = [
(1, "user1@gmail.com", 1, 1, "Ottawa", "Ontario", "Canada", "Jared", None, "Lueck"),
(2, "user2@gmail.com", 2, 2, "Ottawa", "Ontario", "Canada", "John", None, "Lueck"), 
(3, "user3@gmail.com", 3, 3, "Ottawa", "Ontario", "Canada", "Ben", None, "Baker"), 
(4, "user4@gmail.com", 4, 4, "Ottawa", "Ontario", "Canada", "Theo", None, "Holland"),
(5, "user4@gmail.com", 5, 5, "Ottawa", "Ontario", "Canada", "David", None, "Chapmen"),
(6, "user4@gmail.com", 6, 6, "Ottawa", "Ontario", "Canada", "Caden", None, "Koch")
]

hosts = [
(1, "user1@gmail.com", 1, 1, "Ottawa", "Ontario", "Canada", "Jared", None, "Lueck"),
(2, "user2@gmail.com", 2, 2, "Ottawa", "Ontario", "Canada", "John", None, "Lueck"), 
(3, "user3@gmail.com", 3, 3, "Ottawa", "Ontario", "Canada", "Ben", None, "Baker"), 
]

guests = [
(3, "user3@gmail.com", 3, 3, "Ottawa", "Ontario", "Canada", "Ben", None, "Baker"), 
(4, "user4@gmail.com", 4, 4, "Ottawa", "Ontario", "Canada", "Theo", None, "Holland"),
(5, "user4@gmail.com", 5, 5, "Ottawa", "Ontario", "Canada", "David", None, "Chapmen"),
(6, "user4@gmail.com", 6, 6, "Ottawa", "Ontario", "Canada", "Caden", None, "Koch")
]

phonenumbers = [
(1, "333-333-3333"), 
(2, "555-555-5555")
]

payment = [
(1, "Credit", 100.13, "Pending", 1, 3)
]

property = [
(1, 1, 1, "Ottawa", "Ontario", "Canada", "2010-10-17", 4),
(2, 1, 1, "Ottawa", "Ontario", "Canada", "2010-10-17", 4)
]

pricing = [
(1, 10.14, 4, "House"),
(2, 10.14, 4, "Apartment")
]

rental_agreements = [
(1, "2010-10-17", "2010-10-26", "2010-11-03", 1, 5)
]

reviews = [
(1, "Very good", "2012-10-19", 3.4, 3.9, 3.0, 2.5, 1, 3),
(1, "Great place", "2012-10-19", 3.4, 3.9, 3.0, 2.5, 1, 3),
(1, "Liked it a lot", "2012-10-19", 3.4, 3.9, 3.0, 2.5, 1, 3)
]

branches = [
("Canada"),
("USA"),
("France")
]

employee = [
	(1, "Jake", "Evans", "JakeEvans@rentals.com", "developer", 50000.0, "USA"),
	(2, "Harrison", "Cooke", "HarrisonCooke@rentals.com", "finance manager", 50000.0, "Canada"),
	(3, "Darren", "Kane", "DarrenKane@rentals.com", "HR representative", 50000.0, "USA")
]

managers = [
	(1, "Jake", "Evans", "JakeEvans@rentals.com", "developer", 50000.0, "Canada"),
]