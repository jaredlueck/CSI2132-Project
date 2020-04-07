CREATE TRIGGER update_info BEFORE INSERT OR UPDATE ON Rental_User
    FOR EACH ROW EXECUTE PROCEDURE update_host_guest_table();