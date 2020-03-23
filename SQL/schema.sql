CREATE TABLE User (
	user_id int,
	email_address varchar(20),
	unit_number int,
	street_number int,
	city varchar(20),
	province varchar(20),
	country varchar(20),
	firstname varchar(20),
	middlename varchar(20),
	lastname varchar(20),
	primary key (user_id),
	foreign key (country) references Branch(country)
);

CREATE TABLE Host (
	host_id int,
	email_address varchar(20) not null,
	unit_number int,
	street_number int,
	city varchar(20) not null,
	province varchar(20) not null,
	country varchar(20) not null,
	firstname varchar(20) not null,
	middlename varchar(20),
	lastname varchar(20) not null,
	primary key (host_id),
	foreign key (host_id) references User(user_id) 
);

CREATE TABLE Guest (
	guest_id int,
	email_address varchar(20) not null,
	unit_number int,
	street_number int,
	city varchar(20) not null,
	province varchar(20) not null,
	country varchar(20) not null,
	firstname varchar(20) not null,
	middlename varchar(20),
	lastname varchar(20) not null,
	primary key (guest_id),
	foreign key (guest_id) references User(user_id) 
);

CREATE TABLE Phonenumber (
	user_id int,
	phone_number varchar(20),
	primary key (user_id, phone_number),
	foreign key (user_id) references User(user_id)
);

CREATE TABLE Payment (
	transaction_id int,
	transaction_type varchar(20),
	amount float,
	status varchar(20),
	host_id int,
	guest_id int,
	property_id int,
	primary key (transaction_id), 
	foreign key (host_id) references Host(host_id),
	foreign key (guest_id) references Guest(guest_id),
	foreign key (property_id) references Property(property_id)
);

CREATE TABLE Property (
	property_id int,
	unit_number int, 
	street_number int,
	city varchar(20),
	province varchar(20),
	country varchar(20),
	available_date date,
	beds_number int,
	host_id int,
	foreign key (host_id) references Host(host_id),
	primary key (property_id)
	
);

CREATE TABLE Pricing (
	property_id int,
	rate float,
	guest_number int,
	property_type varchar(20),
	primary key (property_id),
	foreign key (property_id) references Property(property_id)
);

CREATE TABLE Rental_Agreement (
	agreement_id int, 
	sign_date date,
	start_date date,	
	end_date date,
	host_id int,
	guest_id int, 
	property_id int,
	foreign key (host_id) references Host(host_id),
	foreign key (guest_id) references Guest(guest_id),
	foreign key (property_id) references Property(property_id)
	primary key(agreement_id)
);

CREATE TABLE Review (
	review_id int,
	comment varchar(20),
	review_date date, 
	communication float,
	checkin float,
	cleanliness float,
	location float,
	property_id int,
	guest_id int,
	primary key (review_id),
	foreign key (property_id) references Property(property_id),
	foreign key (guest_id) references Guest(guest_id)
);

CREATE TABLE Branch (
	country varchar(20),
	primary key (country)
);

CREATE TABLE Employee (
	employee_id int,
	firstname varchar(20),
	lastname varchar(20),
	email_address varchar(20),
	position varchar(20),
	salary float,
	branch varchar(20),
	foreign key (branch) references Branch(country),
	primary key (employee_id)
);

CREATE TABLE Manager (
	manager_id int,
	firstname varchar(20),
	lastname varchar(20),
	email_address varchar(20),
	position varchar(20),
	salary float,
	branch varchar(20),
	foreign key (branch) references Branch(country),
	primary key (manager_id),
	foreign key (manager_id) references Employee(employee_id)
);

