import psycopg2

import createDB as DB
from connectDB import get_connection

con = get_connection()

cur = con.cursor()

print("Enter sql queries to execute")

while True:
    query = input()

    if query == "exit":
        con.close()
        break
    
   

    try:
        cur.execute(query)
        con.commit()
        records = cur.fetchall()

        for row in records:
            print(row)

    except Exception as e:

        print(e)
        cur.execute("ROLLBACK")
        con.commit()



    
