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
	
CREATE OR REPLACE FUNCTION new_property(new_id int, unit_number int, street_number int, 
street varchar(20),  city varchar(20), province varchar(20), country varchar(20), beds_number int)
RETURNS int AS $$ 
	DECLARE property_id int;
	BEGIN 
		property_id := nextval('property_sequence');
		IF NOT isHost(new_id) THEN
			INSERT INTO Host SELECT * FROM Rental_User U Where U.user_id = new_id;
		END IF;
		
		
		INSERT INTO Property VALUES(property_id, unit_number, street_number, street, city, 
									province, country, beds_number, new_id);
									
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
	DECLARE address text;
	BEGIN 
		IF NOT (unit_num is NULL) THEN SELECT concat(street_num, ' ', street_name, ' Unit ', unit_num) INTO address;
		ELSE SELECT CONCAT(street_num, ' ', street_name) INTO address;
		END IF;
		RETURN address;
	END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_availability(prop_id int)
	RETURNS DATE AS $$
	DECLARE res date;
	BEGIN
	IF is_occupied(prop_id) = 'OCCUPIED' THEN SELECT MAX(end_date) FROM Property P 
	INNER JOIN Rental_Agreement RA ON RA.property_id = P.property_id WHERE P.property_id = prop_id INTO res;
	ELSE SELECT now() into res;
	END IF;
	RETURN res;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION valid_branch(country_in varchar(20))
	RETURNS BOOLEAN AS $$
	BEGIN
	PERFORM * FROM Branch WHERE country = country_in;

	RETURN FOUND;

	END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_host_guest_table()
	RETURNS TRIGGER AS $update_info$
	BEGIN
	IF NOT OLD.email_address = NEW.email_address THEN
	UPDATE Host SET email_address = NEW.email_address WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET email_address = NEW.email_address WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.unit_number = NEW.unit_number THEN
	UPDATE Host SET unit_number = NEW.unit_number WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET unit_number = NEW.unit_number WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.street_number = NEW.street_number THEN
	UPDATE Host SET street_number = NEW.street_number WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET street_number = NEW.street_number WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.street = NEW.street THEN
	UPDATE Host SET street = NEW.street WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET street = NEW.street WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.city = NEW.city THEN
	UPDATE Host SET city = NEW.city WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET city = NEW.city WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.province = NEW.province THEN
	UPDATE Host SET province = NEW.province WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET province = NEW.province WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.firstname = NEW.firstname THEN
	UPDATE Host SET firstname = NEW.firstname WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET firstname = NEW.firstname WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.middlename = NEW.middlename THEN
	UPDATE Host SET middlename = NEW.middlename WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET middlename = NEW.middlename WHERE Guest.guest_id= NEW.user_id;
	END IF;
	
	IF NOT OLD.lastname = NEW.lastname THEN
	UPDATE Host SET lastname = NEW.lastname WHERE Host.host_id= NEW.user_id;
	UPDATE Guest SET lastname = NEW.lastname WHERE Guest.guest_id= NEW.user_id;
	END IF;
	RETURN NEW;
END $update_info$ LANGUAGE plpgsql;
