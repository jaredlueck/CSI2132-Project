import psycopg2
import datetime
from psycopg2 import sql
from tabulate import tabulate


def search_availibilities(id, cur, con):

    while True:
        date = input("Enter the date you are wanting to start your rental (YYYY-MM-DD): ")
        if date == "":
            break
        elif check_date(date):
            break
        else:
            print("Invalid date")
    
    while True:
        try:
            rate_in = input("Enter the max rate you are looking for ($/Night):")
            
            if rate_in == '':
                print("OK")
                rate = 'Infinity'
            else:
                rate = float(rate_in)
                print("Fail")
            break
        except:
            print("Invalid rate")

    search_properties(cur, con, date, rate)

def check_date(date_str):
    try:
        datetime.datetime.strptime(date_str, '%Y-%m-%d')
        return True
    except ValueError:
        return False

def search_properties(cur, con, date, rate):
    
    SQL1 = f"""SELECT construct_address(unit_number, street_number, street), city, province, 
               country, beds_number, rate,guest_number, property_type, get_availability(P.property_id)
               FROM Property P INNER join Pricing PR ON P.property_id = PR.property_id
               LEFT OUTER JOIN Rental_Agreement RA on RA.property_id =  P.property_id
               WHERE ((NOT (RA.start_date <= to_date('{date}', 'YYYY-MM-DD')
               AND to_date('{date}', 'YYYY-MM-DD') <= RA.end_date)  OR ('{date}' = ''))) 
               AND ('{rate}' = '' OR ('{rate}' <> '' AND rate < '{rate}'))"""
              
    cur.execute(SQL1)
    
    res = cur.fetchall()

    print((2 * "\n" ) + tabulate(res, \
    headers=["Address", "City", "Province", "Country", "beds", "Rate ($/Night)", "Number of Guests", "Property Type", "Availibility"]) \
    + (2 * "\n" ))

    
    

