from tabulate import tabulate
import connectDB

con = connectDB.get_connection()
cur = con.cursor()

while True:
    try:
        id = int(input("Welcome to the employee interface of the application. "
                       "Please enter your employee ID to continue: "))
        break
    except ValueError:
        print("Invalid input")

while True:
    cur.callproc("isValidEmployee", [id])

    result = cur.fetchall()

    valid = result[0][0]

    if not valid:
        print("Invalid Employee ID")
        continue

    branch = input("Enter the branch which you wish to view property liting (Or leave empty for all branches): ")

    SQL = f"""SELECT construct_address(unit_number, street_number, street), city, 
              province, country, beds_number, is_occupied(property_id)
              FROM Property WHERE
              (country = '{branch}' OR '{branch}' = '')"""

    cur.execute(SQL)

    res = cur.fetchall()

    print((2 * "\n") + tabulate(res,
                                headers=["Address", "City", "Province", "Country", "Beds", "Occupancy"])
          + (2 * "\n"))
 
