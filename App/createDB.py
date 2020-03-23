import psycopg2

con = psycopg2.connect(database="jluec081", user="jluec081", password="Darthvader22", host="web0.eecs.uottawa.ca", port="15432")

print("Database opened successfully")

cur = con.cursor()

with open('../SQL/clear.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/schema.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/insert_branches.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/insert_users.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/insert_hosts.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/insert_guests.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/insert_properties.sql') as fp:
	cur.execute(fp.read()) 

with open('../SQL/insert_employees.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/insert_managers.sql') as fp:
    cur.execute(fp.read()) 

with open('../SQL/insert_phonenumbers.sql') as fp:
	cur.execute(fp.read()) 

with open('../SQL/insert_pricings.sql') as fp:
	cur.execute(fp.read()) 

with open('../SQL/insert_rental_agreements.sql') as fp:
	cur.execute(fp.read()) 




con.commit()
con.close()