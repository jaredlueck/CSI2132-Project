import psycopg2

import createDB as DB

con = psycopg2.connect(database="postgres", user="postgres", password="", host="localhost", port="5432")

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



    
