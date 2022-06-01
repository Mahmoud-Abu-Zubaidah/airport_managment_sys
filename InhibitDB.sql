-- insert into plane_state
insert into plane_state values(1,'Available');
insert into plane_state values(2,'Not Available');
insert into plane_state values(3,'On Air');
insert into plane_state values(4,'Landing');
insert into plane_state values(5,'Landed');
insert into plane_state values(6,'Launching');
insert into plane_state values(7,'Launched');
insert into plane_state values(8,'OnBoarding');
insert into plane_state values(9,'Accident');

-- insert into airports
insert into airports values('Amman Queen Alia International Airport','Jordan','Amman','AMM');
insert into airports values('King Abdulaziz International Airport','Saudi Arabia','Jeddah','JED');
insert into airports values('King Khalid International Airport','Saudi Arabia','Riyadh','RUH');
insert into airports values('Dubai International Airport','United Arab Emirates','Dubai','DXB');
insert into airports values('Istanbul Airport','Turkey','Istanbul','IST');
insert into airports values('Batman Airport','Turkey','Batman','BAL');
insert into airports values('Yerevan Airport','Armenia','Yerevan','EVN');
insert into airports values('Kuwait Airport','Kuwait','Kuwait','KWI');
insert into airports values('Hartsfield-Jackson Atlanta International Airport','United States','Atlanta','ATL');
insert into airports values('Hamad International Airport','Qatar','Doha','DOH');
insert into airports values('Madinah Prince Mohammad Airport','Saudi Arabia','Al Madinah','MED');


-- insert into classes
insert into classes values(1,'First Class');
insert into classes values(2,'Economy Class');
insert into classes values(3,'Business Class');


-- insert into customers
insert into customers values('Mahmoud','Abu-Zubaidah',20,'12345678A',0786952136,'m@gmail.com','Male','AB-');
insert into customers values('Rama','Hummad',29,'12347858C',0786958626,'lolo@gmail.com','Female','A+');
insert into customers values('Steve','Zaitoon',77,'98847858C',0787425626,'steev@gmail.com','Male','B-');
insert into customers values('Mark','Zain',18,'98748558T',0787036526,'v1v@gmail.com','Male','O-');
insert into customers values('Lola','Uoon',37,'15747858L',0798524626,'uoon@gmail.com','Female','AB+');
insert into customers values('Meranda','Cola',44,'15210758C',0775965626,'pepsi@gmail.com','Female','O+');
insert into customers values('Rami','Medein',54,'33310758G',0775618626,'rar@gmail.com','Male','A+');


-- insert into airlines
insert into airlines values('Emirates','EK',200,140,75);
insert into airlines values('Swiss','LX',155,100,40);
insert into airlines values('Eurowings','EW',225,170,115);
insert into airlines values('Qatar Airways','QR',190,160,55);
insert into airlines values('Turkish Airlines','TK',175,110,40);
insert into airlines values('EasyJet','U2',100,40,20);
insert into airlines values('Royal Dutch Airlines','KL',240,140,120);
insert into airlines values('Belavia','B2',340,180,100);
insert into airlines values('Wizz Air','W6',140,75,40);
insert into airlines values('Laudamotion','OE',350,275,140);


--insert into airplanes
-- code , name , airline , state , (economy , busniess , first (classes) capacity)
insert into airplanes values('A380','Airbus A380-800','AMM','EK',1,6,10,50);
insert into airplanes values('B77L','Boeing 777-200LR / Boeing 777F','DXB','EK',1,7,15,100);
insert into airplanes values('A343','Airbus A340-300','DOH','LX',1,4,11,150);
insert into airplanes values('A333','Airbus A330-300','JED','LX',1,7,15,200);
insert into airplanes values('A319','Airbus A319','JED','EW',1,3,10,100);
insert into airplanes values('B738','Boeing 737-800','JED','EW',1,20,50,150);
insert into airplanes values('B788','Boeing 787-8','RUH','QR',1,14,30,200);
insert into airplanes values('B789','Boeing 787-9','DXB','QR',1,5,10,250);
insert into airplanes values('B78X','Boeing 787-10','IST','QR',1,9,20,300);
insert into airplanes values('A332','Airbus A330-200','IST','TK',1,5,22,150);
insert into airplanes values('T-41B','Cessna T-41 Mescalero','BAL','TK',1,4,0,0);
insert into airplanes values('A318','Airbus A318 Elite','EVN','U2',1,7,0,0);

--INSERT INTO AIRPORT_LINES
insert into airport_lines values(1,0,0,0, 'Amman',null,'27-MAR-22',1,'A380','AMM','JED')
insert into airport_lines values(2,2,1,0, 'Saudi Arabia','08-MAY-22','08-MAR-22',3,'A318','RUH','MED');
insert into airport_lines values(3,0,1,0, 'Turkey','18-MAY-22','18-MAR-22',2,'A333','RUH','IST');
insert into airport_lines values(4,0,1,0, 'Turkey','01-MAR-22','02-MAR-22',4,'A319','RUH','IST');
insert into airport_lines values(5,0,0,0, 'Jeddah','01-MAR-22','01-MAR-22',5,'A319','DXB','JED');
insert into airport_lines values(6,0,0,0, 'Dubai','10-MAR-22','10-MAR-22',1,'B77L','ATL','DOH');

-- insert reservation
INSERT INTO RESERVATIONS VALUES('Amman' , '27-MAR-22' , NULL , 'Work' , '11' , NULL , 1 , '98847858C' ,1);
INSERT INTO RESERVATIONS VALUES('Saudi Arabia' , '27-MAR-22' , '25-MAY-22' , 'Tourist', 3 , NULL , 1 , '15747858L' ,2);
INSERT INTO RESERVATIONS VALUES('Turkey' , '20-MAR-22' , '30-MAY-22' , 'Business', 2 , NULL , 1 , '12345678O' ,1);
INSERT INTO RESERVATIONS VALUES('Turkey' , '20-MAR-22' , '30-MAY-22' , 'Business', 4 , NULL , 2 , '33310758G' ,3);
INSERT INTO RESERVATIONS VALUES('Saudi Arabia' , '20-MAR-22' , '30-MAY-22' , 'Business', 5 , NULL , 3 , '33310758G' ,2);

-- ADD foreign keys
-- customers ~ reservations
ALTER TABLE reservations add constraint reservation_passport_fk FOREIGN KEY (passport_num) REFERENCES customers(passport_num);
-- classes ~ reservations
ALTER TABLE reservations add constraint reservation_class_fk FOREIGN KEY (class_id) REFERENCES classes(class_id);
-- airport_lines ~ reservations
ALTER TABLE reservations add constraint reservation_return_date_fk FOREIGN KEY (flight_return_number) REFERENCES airport_lines(flight_number);
-- airport_lines ~ reservations
ALTER TABLE reservations add constraint reservation_flight_date_fk FOREIGN KEY (flight_number) REFERENCES airport_lines(flight_number);
-- airplanes ~ airport_lines
ALTER TABLE airport_lines add constraint airportLine_planeCode_fk FOREIGN KEY (plane_code) REFERENCES airplanes(plane_code);
-- airports ~ airport_lines
ALTER TABLE airport_lines add constraint airportLine_fromPort_id_fk FOREIGN KEY (from_airport_id) REFERENCES airports(code);
-- airports ~ airport_lines
ALTER TABLE airport_lines add constraint airportLine_toPort_i_fk FOREIGN KEY (to_airport_id) REFERENCES airports(code);
-- airports ~ airplanes
ALTER TABLE airplanes add constraint airplane_position_fk_portId FOREIGN KEY (current_position_id) REFERENCES airports(code);
-- airports ~ airplanes
ALTER TABLE airplanes add constraint airplane_lineCode_fk FOREIGN KEY(airline_code) REFERENCES airlines(airline_code);

commit;
