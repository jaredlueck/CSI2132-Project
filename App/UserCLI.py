import psycopg2
import list_property as LP
import search_properties as SP
import connectDB
from tabulate import tabulate

con = connectDB.get_connection()
cur = con.cursor()

while True:

    email = input("Welcome to Host/Guest Interface. Please Enter your email adress to continue: ")

    cur.callproc("isValidUser", [email])

    result = cur.fetchall()

    valid = result[0][0]

    if not valid:
        print("invalid email")
        continue
    else:
        cur.execute("SELECT user_id FROM Rental_User U Where U.email_address = %s", (email,))
        id = cur.fetchall()[0][0]

    while True:

        op = input("enter 'list' to list a property for rental or 'search' to check property availibilities: ")

        if op == 'list':
            LP.list_property(id, cur, con)
        elif op == 'search':
            SP.search_availibilities(id, cur, con)
        elif op == 'view':
            cur.execute(f"""SELECT construct_address(unit_number, street_number, street), 
            city, province, country, beds_number FROM Property where host_id = {id}""")
            res = cur.fetchall()
            print((2 * "\n" ) + tabulate(res, \
            headers=["Address", "City", "Province", "country", "beds", "rate"] )\
            + (2 * "\n" ))
        





   
    

    

        
        
    
    



    

    

    

    
    
    

    
