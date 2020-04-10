import psycopg2
import list_property as LP
import search_properties as SP
import connectDB
from tabulate import tabulate

user_field_map = {"Email Address": "email_address",
                              "Unit Number": "unit_number",
                              "Street Number": "street_number",
                              "Street": "street",
                              "City": "city",
                              "Province": "province",
                              "Country": "country",
                              "First Name": "firstname",
                              "Middle Name": "middlename",
                              "Last Name": "lastname"}

con = connectDB.get_connection()
cur = con.cursor()

def valid_country(country, cur):
        cur.callproc("valid_branch", [country,])
        res = cur.fetchall()[0][0]
        return res

while True:

    email = input("Welcome to Host/Guest Interface. Please Enter your email address to continue: ")

    cur.callproc("isValidUser", [email])

    result = cur.fetchall()

    valid = result[0][0]

    if not valid:
        print("invalid email")
        continue
    else:
        cur.execute("SELECT user_id FROM Rental_User U Where U.email_address = %s", (email,))
        uid = cur.fetchall()[0][0]

    print("\nList of commands:\nlist (List Your Property )\n\nsearch (Search properties)\n\n"
          "view (View your Properties)\n\nremove (Remove a property)\n\ninfo (View your personal info)\n\n"
          "update-info (Update your personal info)\n\n")

    while True:

        op = input("Enter the operation you wish to perform: ")

        if op == 'list':
            LP.list_property(uid, cur, con)
        elif op == 'search':
            SP.search_availibilities(uid, cur, con)
        elif op == 'view':
            cur.execute(f"""SELECT construct_address(unit_number, street_number, street), 
            city, province, country, beds_number FROM Property where host_id = {uid}""")
            res = cur.fetchall()
            print((2 * "\n") + tabulate(res,
                                        headers=["Address", "City", "Province", "country", "beds", "rate"])
                  + (2 * "\n"))
        elif op == 'remove':
            cur.execute(f"""SELECT property_id, construct_address(unit_number, street_number, street), 
            city, province, country, beds_number FROM Property where host_id = {uid}""")
            res = cur.fetchall()
            print((2 * "\n") + tabulate(res,
                                        headers=["ID", "Address", "City", "Province", "country", "beds"])
                  + (2 * "\n"))
            try:
                to_remove = int(input("Enter the ID of the property to remove: "))
            except:
                print("Invalid ID")

            cur.execute(f"""DELETE FROM Property WHERE property_id = {to_remove}""")
            con.commit()
        elif op == 'info':
            cur.execute(f"SELECT * FROM Rental_User U WHERE U.user_id = '{uid}'")
            print("""##################################\nYour Information\n##################################\n""")
            res = cur.fetchall()
            rows = [
                ("ID", res[0][0]),
                ("Email Address", res[0][1]),
                ("Unit Number", res[0][2]),
                ("Street Number", res[0][3]),
                ("Street", res[0][4]),
                ("City", res[0][5]),
                ("Province", res[0][6]),
                ("Country", res[0][7]),
                ("First name", res[0][8]),
                ("Middle Name", res[0][9]),
                ("Last Name", res[0][10])
            ]
            print(tabulate(rows, headers=("Field", "Value")) + "\n")

        elif op == 'update-info':
            print(
                """Here are the fields you may update:\n
                Email Address
                Unit Number
                Street Number
                Street
                City
                Province
                Country
                First Name 
                Middle Name
                Last Name\n""")

            while True:
                field = input("Enter the field you wish to update (Must be one of the fields above) or "
                              "'exit' to go back: ")
                if field == 'exit':
                    break

                if field not in user_field_map.keys():
                    print("Invalid Field")
                    continue

                while True:
                    val_in = input("Enter the new value: ")
                    
                    if field == "Street Number" or field == "Unit Number":
                        try:
                            new_val = int(val_in)
                        except ValueError:
                            print("Invalid input for Unit Number or Street Number")
                            continue
                    elif field == "Country":
                        if not valid_country(val_in, cur):
                            print("Invalid country. Country must be a country that exists in the 'Branch' table (ex: Canada)")
                            continue
                    break
                
                new_val = val_in

                column = user_field_map[field]
                cur.execute(f"UPDATE Rental_User RU SET {column} = '{new_val}' WHERE RU.user_id = {uid} ")
                con.commit()
        else:
            print("Unknown command. Please enter: list, search, view, remove, info or update-info")


