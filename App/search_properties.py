import psycopg2
import datetime
from psycopg2 import sql
from tabulate import tabulate


def search_availibilities(id, cur, con):

    while True:
        date = input("Enter the data you are wanting to start your rental (YYYY-MM-DD): ")
        if check_date(date):
            break
        else:
            print("Invalid date")

    while True:
        try:
            max_price = float(input("Enter the max rate you are looking for ($/Night)"))
            break
        except:
            print("Invalid rate")

    search_properties(cur, con, date, max_price)

def check_date(date_str):
    try:
        datetime.datetime.strptime(date_str, '%Y-%m-%d')
        return True
    except ValueError:
        return False

def search_properties(cur, con, date, rate):
    SQL = f"""SELECT street_number, street, city, province, country, beds_number, rate,guest_number, property_type
              FROM Property P INNER join Pricing PR ON P.property_id = PR.property_id
              LEFT OUTER JOIN Rental_Agreement RA on RA.property_id =  P.property_id
              WHERE NOT  (RA.start_date <= to_date('{date}', 'YYYY-MM-DD')
              AND to_date('{date}', 'YYYY-MM-DD') <= RA.end_date) AND rate < {rate}"""

    cur.execute(SQL)

    res = cur.fetchall()

    print((2 * "\n" ) + tabulate(res, \
    headers=["Street Number", "Street", "City", "Province", "country", "beds", "rate", "Guests", "Property Type"]) \
    + (2 * "\n" ))

    
    

