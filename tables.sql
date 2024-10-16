Create tables in this order: ownership > country > ferry > room > passenger > crew

CREATE TABLE ownership (
	id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(50),
	networth int
);

CREATE TABLE country (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(20),
    continent varchar(15),
    ports int
);


CREATE TABLE ferry (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    capacity int,
    ticketfee int, 
    transit varchar(75),
    destination varchar(75),
    ownership_id int,
    country_id int,
    FOREIGN KEY (ownership_id) REFERENCES ownership(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
    );

CREATE TABLE room (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(4),
    type varchar(25),
    floor int,
    ferry_id int,
    FOREIGN KEY (ferry_id) REFERENCES ferry(id)
 );

CREATE TABLE passenger (
	id int AUTO_INCREMENT PRIMARY KEY,
    	name varchar(35), 
    	departuretime varchar(4),
	ferry_id int,
	room_id int,
    	FOREIGN KEY (ferry_id) REFERENCES ferry(id),
	FOREIGN KEY (room_id) REFERENCES room(id) 
	);

CREATE TABLE crew (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    position varchar(35),
    salary int,
    ferry_id int,
    room_id int,
    FOREIGN KEY (ferry_id) REFERENCES ferry(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);