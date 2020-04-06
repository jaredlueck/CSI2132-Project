CREATE OR REPLACE FUNCTION isValidUser(email varchar(50)) 
  RETURNS BOOLEAN AS $$ 
		BEGIN 
			 PERFORM * FROM Rental_User U WHERE U.email_address = email;
			IF FOUND THEN RETURN TRUE;
			ELSE 
			RETURN FALSE;
			END IF;
		END
	$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION isValidEmployee(id int) 
  RETURNS BOOLEAN AS $$ 
		BEGIN 
			 PERFORM * FROM Employee E WHERE E.employee_id = id;
			IF FOUND THEN RETURN TRUE;
			ELSE 
			RETURN FALSE;
			END IF;
		END
	$$ LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION isHost(id INT) 
  RETURNS BOOLEAN AS $$ 
		BEGIN 
			 PERFORM * FROM Host H WHERE H.host_id = id;
			IF FOUND THEN RETURN TRUE;
			ELSE 
			RETURN FALSE;
			END IF;
		END
	$$ LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION new_property(user_id int, unit_number int, street_number int, 
street varchar(20),  city varchar(20), province varchar(20), country varchar(20), beds_number int)
RETURNS int AS $$ 
	DECLARE property_id int;
	BEGIN 
		property_id := nextval('property_sequence');
		IF NOT isHost(user_id) THEN
			INSERT INTO Host SELECT * FROM User U Where U.user_id = user_id;
		END IF;
		
		
		INSERT INTO Property VALUES(property_id, unit_number, street_number, street, city, 
									province, country, beds_number, user_id);
									
		RETURN property_id;
	END $$ LANGUAGE plpgsql;
									
CREATE OR REPLACE FUNCTION new_pricing(property_id int, rate float, guest_number int, property_type varchar(20))
	RETURNS void AS $$
		BEGIN
			INSERT INTO Pricing VALUES(property_id, rate, guest_number, property_type);
		END
	$$ LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION is_occupied(id int)
	RETURNS VARCHAR as $$
	BEGIN
		PERFORM * FROM Property P INNER JOIN Rental_Agreement RA ON RA.property_id = P.property_id 
		WHERE P.Property_id = id AND RA.start_date <= now() AND RA.end_date >= now();
		IF FOUND THEN RETURN 'OCCUPIED';
		ELSE RETURN 'UNOCCUPIED';
		END IF;
	END
	$$ LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION construct_address(unit_num int, street_num int, street_name varchar)	
	RETURNS VARCHAR as $$
	DECLARE 
	BEGIN 
		IF NOT unit_num = NULL THEN RETURN SELECT concat(street_num, ' ', street_name, ' Unit ', unit_num);
		ELSE SELECT concat(street_num, ' ', street_name) as RESULT;
	END $$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION construct_address(unit_num int, street_num int, street_name varchar)	
	RETURNS VARCHAR as $$
	DECLARE address text;
	BEGIN 
		IF NOT (unit_num is NULL) THEN SELECT concat(street_num, ' ', street_name, ' Unit ', unit_num) INTO address;
		ELSE SELECT CONCAT(street_num, ' ', street_name) INTO address;
		END IF;
		
		RETURN address;
	END $$ LANGUAGE plpgsql;

	
	
