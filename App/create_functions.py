import psycopg2

con = psycopg2.connect(database="postgres", user="postgres", password="Darthvader22", host="localhost", port="5432")
cur = con.cursor()


with open('../SQL/functions.sql') as fp:
        cur.execute(fp.read())

con.commit()
