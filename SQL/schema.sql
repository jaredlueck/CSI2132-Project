CREATE TABLE Branch (
	country varchar(20),
	primary key (country)
);

CREATE TABLE Rental_User (
	user_id int,
	email_address varchar(50) not null,
	unit_number int,
	street_number int,
	street varchar(20),
	city varchar(20) not null,
	province varchar(20) not null,
	country varchar(20) not null,
	firstname varchar(20) not null,
	middlename varchar(20),
	lastname varchar(20) not null,
	primary key (user_id),
	foreign key (country) references Branch(country)
);

CREATE TABLE Host (
	host_id int,
	email_address varchar(50) not null,
	unit_number int,
	street_number int,
	street varchar(20),
	city varchar(20) not null,
	province varchar(20) not null,
	country varchar(20) not null,
	firstname varchar(20) not null,
	middlename varchar(20),
	lastname varchar(20) not null,
	primary key (host_id),
	foreign key (host_id) references Rental_User(user_id) 
		on delete cascade
);

CREATE TABLE Guest (
	guest_id int,
	email_address varchar(50) not null,
	unit_number int,
	street_number int,
	street varchar(20),
	city varchar(20) not null,
	province varchar(20) not null,
	country varchar(20) not null,
	firstname varchar(20) not null,
	middlename varchar(20),
	lastname varchar(20) not null,
	primary key (guest_id),
	foreign key (guest_id) references Rental_User(user_id) 
		on delete cascade
);

CREATE TABLE Phonenumber (
	user_id int,
	phone_number varchar(20) not null,
	primary key (user_id, phone_number),
	foreign key (user_id) references Rental_User(user_id)
);

CREATE TABLE Property (
	property_id int,
	unit_number int, 
	street_number int not null,
	street varchar(20) not null,
	city varchar(20) not null,
	province varchar(20),
	country varchar(20) not null,
	available_date date not null,
	beds_number int not null,
	host_id int not null,
	foreign key (host_id) references Host(host_id)
		on delete cascade,
	primary key (property_id),
	foreign key (country) references Branch(country) 
	
);

CREATE TABLE Payment (
	transaction_id int,
	transaction_type varchar(20),
	amount float not null,
	status varchar(20),
	host_id int not null,
	guest_id int not null,
	property_id int not null,
	primary key (transaction_id), 
	foreign key (host_id) references Host(host_id),
	foreign key (guest_id) references Guest(guest_id),
	foreign key (property_id) references Property(property_id)
);

CREATE TABLE Pricing (
	property_id int,
	rate float not null,
	guest_number int not null,
	property_type varchar(20),
	primary key (property_id),
	foreign key (property_id) references Property(property_id)
		on delete cascade
);

CREATE TABLE Rental_Agreement (
	agreement_id int, 
	sign_date date not null,
	start_date date not null,	
	end_date date not null,
	host_id int not null,
	guest_id int not null, 
	property_id int,
	foreign key (host_id) references Host(host_id)
		on delete cascade,
	foreign key (guest_id) references Guest(guest_id)
		on delete cascade,
	foreign key (property_id) references Property(property_id)
		on delete set null,
	primary key(agreement_id)
);

CREATE TABLE Review (
	review_id int,
	comment varchar(20) not null,
	review_date date not null, 
	communication float,
	checkin float,
	cleanliness float,
	location float,
	property_id int,
	guest_id int,
	primary key (review_id),
	foreign key (property_id) references Property(property_id)
		on delete set null,
	foreign key (guest_id) references Guest(guest_id)
		on delete set null
);

CREATE TABLE Employee (
	employee_id int,
	firstname varchar(20) not null,
	lastname varchar(20) not null,
	email_address varchar(50) not null,
	position varchar(20),
	salary float,
	branch varchar(20) not null,
	foreign key (branch) references Branch(country),
	primary key (employee_id)
);

CREATE TABLE Manager (
	manager_id int,
	firstname varchar(20) not null,
	lastname varchar(20)not null,
	email_address varchar(50) not null,
	position varchar(20),
	salary float,
	branch varchar(20) not null,
	foreign key (branch) references Branch(country),
	primary key (manager_id),
	foreign key (manager_id) references Employee(employee_id)
);

