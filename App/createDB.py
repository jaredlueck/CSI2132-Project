import sqlite3
import os

os.remove('RentalSystem.db')

conn = sqlite3.connect('RentalSystem.db')

cur = conn.cursor()

cur.execute("PRAGMA foreign_keys=ON")

with open('../SQL/schema.sql') as fp:
    cur.executescript(fp.read()) 



users = [
(1, "user1@gmail.com", 1, 1, "Ottawa", "Ontario", "Canada", "Jared", None, "Lueck"),
(2, "user2@gmail.com", 2, 2, "Ottawa", "Ontario", "Canada", "John", None, "Lueck"), 
(3, "user3@gmail.com", 3, 3, "Ottawa", "Ontario", "Canada", "Ben", None, "Baker"), 
(4, "user4@gmail.com", 4, 4, "Ottawa", "Ontario", "Canada", "Theo", None, "Holland"),
(5, "user4@gmail.com", 5, 5, "Ottawa", "Ontario", "Canada", "David", None, "Chapmen"),
(6, "user4@gmail.com", 6, 6, "Ottawa", "Ontario", "Canada", "Caden", None, "Koch"),
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

payments = [
(1, "Credit", 100.13, "Pending", 1, 5, 2)
]

properties = [
(1, 1, 1, "Ottawa", "Ontario", "Canada", "2010-10-17", 4, 2),
(2, 1, 1, "Ottawa", "Ontario", "Canada", "2010-10-17", 4, 1)
]

pricings = [
(1, 10.14, 4, "House"),
(2, 10.14, 4, "Apartment")
]


rental_agreements = [
(1, "2010-10-17", "2010-10-10", "2010-11-03", 1, 5, 2)
]

reviews = [
(1, "Very good", "2012-10-19", 3.4, 3.9, 3.0, 2.5, 2, 3),
(2, "Great place", "2012-10-19", 1.0, 2.9, 1.0, 2.5, 2, 3),
(3, "Liked it a lot", "2012-10-19", 3.4, 3.9, 3.0, 2.5, 1, 3)
]

branches = [
("Canada",),
("USA",),
("France",)
]

employees = [
	(1, "Jake", "Evans", "JakeEvans@rentals.com", "developer", 50000.0, "USA"),
	(2, "Harrison", "Cooke", "HarrisonCooke@rentals.com", "finance manager", 50000.0, "Canada"),
	(3, "Darren", "Kane", "DarrenKane@rentals.com", "HR representative", 50000.0, "USA")
]

managers = [
	(1, "Jake", "Evans", "JakeEvans@rentals.com", "developer", 50000.0, "Canada"),
]

cur.executemany("INSERT INTO Branch VALUES(?)", branches)

cur.executemany("INSERT INTO User VALUES(?,?,?,?,?,?,?,?,?,?)", users)

cur.executemany("INSERT INTO Host VALUES(?,?,?,?,?,?,?,?,?,?)", hosts)

cur.executemany("INSERT INTO Guest VALUES(?,?,?,?,?,?,?,?,?,?)", guests)

cur.executemany("INSERT INTO Phonenumber VALUES(?,?)", phonenumbers)



cur.executemany("INSERT INTO Property VALUES(?,?,?,?,?,?,?,?,?)", properties)

cur.executemany("INSERT INTO Payment VALUES(?,?,?,?,?,?,?)", payments)

cur.executemany("INSERT INTO Pricing VALUES(?,?,?,?)", pricings)

cur.executemany("INSERT INTO Rental_Agreement VALUES(?,?,?,?,?,?, ?)", rental_agreements)

cur.executemany("INSERT INTO Review VALUES(?,?,?,?,?,?,?,?,?)", reviews)

cur.executemany("INSERT INTO Employee VALUES(?,?,?,?,?,?,?)", employees)

cur.executemany("INSERT INTO Manager VALUES(?,?,?,?,?,?,?)", managers)

conn.commit()