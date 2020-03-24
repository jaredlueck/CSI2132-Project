import psycopg2

#Put DB Login here

con = psycopg2.connect(database="jluec081", user="jluec081", password="", host="web0.eecs.uottawa.ca", port="15432")


cur = con.cursor()

with open('../SQL/clear.sql') as fp:
    cur.execute(fp.read()) 

print("Creating tables...", end="")

with open('../SQL/schema.sql') as fp:
    cur.execute(fp.read()) 

print("Done\n")

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

with open('../SQL/insert_reviews.sql') as fp:
    cur.execute(fp.read()) 

con.commit()
con.close()