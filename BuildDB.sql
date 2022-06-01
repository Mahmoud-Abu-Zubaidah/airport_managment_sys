-- CREATE CUSTOMERs TABLE
CREATE TABLE customers
(
    first_name varchar2(50) NOT NULL,
    last_name varchar2(50),
    age number(3),
    passport_num char(10) constraint customer_passport_pk PRIMARY KEY,
    phone number(20) NOT NULL,
    email varchar2(50) NOT NULL,
    gender char(6) NOT NULL,
    blood_type varchar2(3) NOT NULL,
    constraint customer_phone_un UNIQUE (phone)
);
-- CREATE RESERVATIONs TABLE 
CREATE TABLE reservations
(
    destination varchar2(50) NULL,
    flight_date date NOT NULL,
    return_date date,
    purpose varchar2(100),
    client_id number(10) constraint reservation_id_pk primary key,
    flight_return_number number(10),
    flight_number number(10),
    passport_num char(10),
    class_id number(1)
);
-- CREATE CLASSESs TABLE
CREATE TABLE classes(
    class_id number(1) constraint class_id_pk PRIMARY KEY,
    class_name varchar2(20)
);
-- CREATE TABLE PLANE_STATE
CREATE TABLE plane_state(
    status_code number(2) constraint planeState_code_id PRIMARY KEY,
    status_name varchar2(50)
);
-- CREATE AIRPORT LINEs TABLE 
CREATE TABLE airport_lines
(
    flight_number number(10) constraint airportLine_number_pk primary key,
    first_class number(2) default 0,
    business_class number(2) default 0,
    economy_class number(3) default 0,
    distance varchar2(50) NOT NULL,
    arrived_time date ,
    fly_time date NOT NULL,
    status_code number(2) constraint status_code_airline_fk REFERENCES plane_state(status_code),
    plane_code varchar2(7),
    from_airport_id varchar2(3) NOT NULL,
    to_airport_id varchar2(3) not null
);
-- CREATE AIRPORTs TABLE
CREATE TABLE airports
(
    port_name varchar2(255) NOT NULL,
    country varchar2(50),
    city varchar2(100) NOT NULL,
    code varchar2(3) constraint airport_code_pk PRIMARY KEY
);
-- CREATE AIRPLANEs TABLE
CREATE TABLE airplanes
(
    plane_code varchar2(5) constraint airplane_code_pk PRIMARY KEY,
    model varchar2(50) constraint airplane_model_un unique,
    current_position_id varchar2(3),
    airline_code varchar2(5),
    status_code number(2) default (1) constraint status_code_plane_fk REFERENCES plane_state(status_code) ,
    first_class number(2) default 0,
    business_class number(2) default 0,
    economy_class number(3) default 0
);
-- CREATE AIRLINEs TABLE 
CREATE TABLE airlines
(
    name varchar2(255) NOT NULL,
    airline_code varchar2(5) constraint airlines_code_pk PRIMARY KEY,
    first_class_cost number(5) default 0,
    business_class_cost number(5) default 0,
    economy_class_cost number(5) default 0
);
-- CREATE FUNCTIONS SECTION

/*
This function return either 'true' if you can add customer to a specific airplane on airport line 
or 'false' if plane is full on airplane class you shosse.
the variable that returned it is boolean data type.
*/

CREATE OR REPLACE FUNCTION add_service(x_class_name varchar2, x_flight_number number)
RETURN boolean
is
adding_result boolean := true; --Will changed if plane has no space to add customer
capacity number(3) :=0;
reserved number(3) :=0;
BEGIN 
--FIRST CLASS IMPLEMENTATION
     IF LOWER(x_class_name) = 'first_class' THEN
	SELECT 
	al.first_class AS taken ,ap.first_class AS First_class_cap
	INTO reserved, capacity
	FROM 
	airport_lines al, airplanes ap
	WHERE
	al.plane_code = ap.plane_code 
	And al.flight_number = x_flight_number;
--ECONOMY CLASS IMPLEMENTATION
     ELSIF LOWER(x_class_name) = 'economy_class' THEN
	SELECT 
	al.first_class AS taken ,ap.first_class AS First_class_cap
	INTO reserved, capacity
	FROM 
	airport_lines al, airplanes ap
	WHERE
	al.plane_code = ap.plane_code 
	And al.flight_number = x_flight_number;
--BUSINESS CLASS IMPLEMENTATION
     ELSIF LOWER(x_class_name) = 'business_class' then
	SELECT 
	al.first_class AS taken ,ap.first_class AS First_class_cap
	INTO reserved, capacity
	FROM 
	airport_lines al, airplanes ap
	WHERE
	al.plane_code = ap.plane_code 
	And al.flight_number = x_flight_number;
--OTHERWISE
     ELSE
	adding_result := false;
     END IF;
--END CHICKING IF PLANE HAS FREE SPACE
--
--CHANGE VALUE FOR BOOLEAN VARIABLE FOR ADDING OR NOT
IF reserved >= capacity THEN
	adding_result := false;
ELSE
	adding_result := true;
END IF;
RETURN adding_result;
--END
END add_service;

-- create view that has user name and password 
create or replace view login as
select airline_code ,concat(airline_code,'123') as password from airlines;



create or replace view full_plane_info as
select plane_code, model, status_name,current_position_id,name as Host,economy_class,business_class,first_class
from airplanes ap ,airlines al,plane_state ps
where ap.airline_code = al.airline_code and ap.status_code = ps.status_code;


--class id sequence
create sequence ClassId_gen_seq
start with 4;

--plane state code sequemce
create sequence stcode_gen_seq
start with 10;

--air port lines number sequence
create sequence flight_number_gen_seq
start with 1111;

commit;