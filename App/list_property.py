def list_property(id, cur, con):
    print("Please fill out the details of your property")

    while True:
        try:
            unit_num = int(input("Enter the unit number for your property: "))
            break
        except:
            print("Must be an integer number")

    while True:
        try:
            street_num = int(input("Enter the street number for your property: "))
            break

        except:
            print("Must be an integer number")

    while True:
        street = input("Enter the street name of your property: ")
        if street == "":
            print("street cannot be empty")
            continue
        else:
            break

    while True:
        city = input("Enter the city of your property: ")
        if street == "":
            print("city cannot be empty")
            continue
        else:
            break

    while True:
        province = input("Enter the province of your property: ")
        if province == "":
            print("province cannot be empty")
            continue
        else:
            break

    while True:
        country = input("Enter the country of your property: ")
        if country == "":
            print("country cannot be empty")
            continue
        else:
            break

    while True:
        try:
            beds_number = int(input("Enter the number of beds your property has: "))
            break
        except:
            print("Invalid Input")

    while True:
         try:
             rate = float(input("Enter the rate ($/Night) of your property: "))
             break
         except:
             print("Invalid input")

    while True:
         try:
             guest_number = int(input("Enter the number of guests for your property: "))
             break
         except:
             print("Invalid input")
             
    while True:
        property_type = input("Enter the type of your property [House, Loft, Apartment or Chalet]: ")
        if property_type == "":
            print("city province be empty")
            continue
        elif property_type not in ["House", "Loft", "Apartment", "Chalet"]:
            print("Invalid Property Type")
        else:
            break

    cur.callproc("new_property", [id, unit_num, street_num, street, city, province, country, beds_number])

    con.commit()

    print("Your property has been listed!")

    property_id = cur.fetchall()[0][0]

    con.commit()

    cur.callproc("new_pricing", [property_id, rate, guest_number, property_type])

    con.commit()

    
     
