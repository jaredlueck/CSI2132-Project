from configparser import ConfigParser
import psycopg2

def get_connection():

    parser = ConfigParser()
    
    parser.read("config.ini")

    db = parser.get("POSTGRESQL", "database")

    user = parser.get("POSTGRESQL", "user")

    password = parser.get("POSTGRESQL", "password")

    host = parser.get("POSTGRESQL", "host")

    port = parser.get("POSTGRESQL", "port")

    con = psycopg2.connect(database=db, user=user,\
                           password=password, host=host, port=port)

    return con
    
