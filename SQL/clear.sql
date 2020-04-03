/*The following is not my code, it is from 
https://dba.stackexchange.com/questions/152462/postgres-how-to-drop-all-the-table-in-a-schema-through-command. 
I simply used it in the event that I would like to remove all the data from the tables. (drop all the tables) */

DO $$ DECLARE
    tabname RECORD;
BEGIN
    FOR tabname IN (SELECT tablename 
                    FROM pg_tables 
                    WHERE schemaname = current_schema()) 
LOOP
    EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(tabname.tablename) || ' CASCADE';
END LOOP;

END $$;

