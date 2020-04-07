import psycopg2
from tabulate import tabulate
import connectDB


con = connectDB.get_connection()
cur = con.cursor()

while True:
    try:
        id = int(input("Welcome to the employee interface of the application. Please enter your employee ID to continue: "))
        break
    except:
        print("Invalid input")

while True:
    

    cur.callproc("isValidEmployee", [id])

    result = cur.fetchall()

    valid = result[0][0]

    if not valid:
        print("Invalid Employee ID")
        continue

    branch = input("Enter the branch which you wish to view property liting (Or leave empty for all branches): ")

    SQL = f"""SELECT construct_address(unit_number, street_number, street), city, province, country, beds_number, is_occupied(property_id)
              FROM Property WHERE
              (country = '{branch}' OR '{branch}' = '')"""

    SQL2 = """WITH X AS (SELECT construct_address(unit_number, street_number, street), city, province, country, beds_number, is_occupied(property_id) as occupancy
              FROM Property WHERE
              (country = '{branch}' OR '{branch}' = '')) SELECT 
			 cast( (SELECT COUNT(*) FROM X WHERE X.occupancy = 'OCCUPIED') as float) / (SELECT COUNT(*) FROM X) * 100;"""

    cur.execute(SQL)

    res = cur.fetchall()

    print((2 * "\n" ) + tabulate(res, \
    headers=["Address", "City", "Province", "Country", "Beds", "Occupancy"]) \
    + (2 * "\n" ))

    cur.execute(SQL2)
    res = cur.fetchall()
    print(res)
    

    

    





