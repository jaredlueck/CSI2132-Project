import psycopg2

#Put DB Login here

if __name__ == "__main__":

    con = psycopg2.connect(database="postgres", user="postgres", password="Darthvader22", host="localhost", port="5432")

    cur = con.cursor()

    print("Creating tables...", end="")

    with open('../SQL/schema.sql') as fp:
        cur.execute(fp.read()) 

    print("Done\n")

    print("Populating tables...", end="")

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

    with open('../SQL/insert_payments.sql') as fp:
        cur.execute(fp.read())

    con.commit()

    print("Done\n")


