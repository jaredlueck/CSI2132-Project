import psycopg2
import connectDB

if __name__ == "__main__":

    con = connectDB.get_connection()
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

    print("Done\n")
    
    print("Creating functions...", end="")

    with open('../SQL/functions.sql') as fp:
        cur.execute(fp.read())
    
    print("Done\n")
    
    print("Creating triggers...", end="")

    with open('../SQL/triggers.sql') as fp:
        cur.execute(fp.read())
    
    print("Done\n")
    
    con.commit()
