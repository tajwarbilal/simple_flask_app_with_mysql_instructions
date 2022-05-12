create table airport
	(name		varchar(32),
	 city		varchar(32),
	country		varchar(32),
	 primary key (name)
	);

create table airline
	(name		varchar(32),
	 airplane	varchar(32),
	 primary key (name)
	);

create table airplane
	(id_number		varchar(8),
	airline	varchar(32),    
     	number_of_seats int,
	age int,
	manafacturing_company	varchar(32),
	 primary key (id_number,airline)

	);

create table consists
	(name		varchar(32),
	 id_number	varchar(8),
     primary key (name, id_number),
	 foreign key (id_number) references airplane (id_number),
     foreign key (name) references airline (name)
	);


create table flights
	(arrival_airport	varchar(32),
	 departure_airport	varchar(32),
	flight_number		varchar(8),
	status			varchar(32),
     departure_date	varchar(32),
     arrival_date	varchar(32),
     base_price		varchar(32),
     airplane_id	varchar(8),
     primary key (arrival_airport, flight_number, departure_date),
	 foreign key (arrival_airport) references airport (name)
	);


create table airline_staff
	(username		varchar(32),
	 password	varchar(32),
     first_name	varchar(32),
     last_name	varchar(32),
     date_of_birth	varchar(32),
     phone_number varchar(32),
     airline_name varchar(32),
     primary key (username),
	 foreign key (airline_name) references airline (name)
	);

create table customer
	(email		varchar(32),
	 password	varchar(32),
     name	varchar(32),
     address	varchar(32),  
     phone_number varchar(32),
     pasport_number varchar(32),
     card_number	varchar(32),  
     primary key (email),
     foreign key (email) references ticket (customer_email),
     foreign key (address) references address (building_number),
     foreign key (passport_number) references passport(passport_number),

	);

create table ticket(
	customer_email	varchar(32),
	address		varchar(32),
	travel_class	varchar(32),
	airline_name	varchar(32),
	flight_number	varchar(8),
	sold_price	varchar(32),
	primary key (customer_email, flight_number),
	foreign key (address) references address (building_number)
);

create table address
	(building_number varchar(32),
     street varchar(32),
     city varchar(32),
     state varchar(16),
     primary key (building_number)
	);

create table passport
	(passport_number varchar(32),
     expiration varchar(32),
     country varchar(32),
     date_of_birth	varchar(32),
     primary key (passport_number)
	);


create table payment_information
	(card_number varchar(32),
     expiration_date varchar(32),
     name_on_card varchar(32),
     type	varchar(32),
     purchase_date	varchar(32),
     purchase_time	varchar(32),
     primary key (card_number, expiration_date),
     foreign key (card_number) references customer(card_number)
	);


create table ratings(
	flight_number	varchar(8),
	individual_rating	float(8),
	average_rating		float(8),
	comments	varchar(32),
	primary key (flight_number, individual_rating)
);


create table phone_number(
	area_code 	varchar(4),
	phone_num	varchar(8),
	primary key (area_code, phone_num)
);
