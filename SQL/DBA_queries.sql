CREATE VIEW property_pricing AS SELECT * FROM Property INNER JOIN Pricing USING (property_id)

CREATE ROLE manager;

GRANT UPDATE ON Employee TO manager;

CREATE ROLE host_role;

GRANT UPDATE ON Property TO host_role;

REVOKE ALL ON manager FROM PUBLIC;

SELECT  * FROM  pg_stat_user_tables;