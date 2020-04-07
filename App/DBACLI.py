import psycopg2

import connectDB
import createDB as DB

con = connectDB.get_connection()

DB.createDB(con)

cur = con.cursor()

print("Enter sql queries to execute")

while True:
    query = input()

    if query == "exit":
        con.close()
        break
    
   

    try:
        cur.execute(query)
        records = cur.fetchall()

        for row in records:
            print(row)

    except Exception as e:

        print(e)
        cur.execute("ROLLBACK")
        con.commit()



    
