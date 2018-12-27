--create and insert data to tables--

--airline--

 create table Airline
 (
 Airline_code varchar(50),
 F_name varchar(50)Not Null,
 L_name varchar(50),
 Email varchar(100),
 Web varchar(50),
 Address1 varchar(50),
 Address2 varchar(50),
 Address3 varchar(50),
 Fleet_size bigint,
 No_of_destinations int,
 Year_c_operation int,

 CONSTRAINT pk_Airline_code PRIMARY KEY (Airline_code),
)

insert into Airline
values ('205','Nippon','Airways','airways@nippon.com','www.nipponairways.com','MInato','Tokyo','Japan',1500,100,1999)
insert into Airline
values ('255','Thai','Airways','Thai@nairlines.com','www.airthai.com','89 Vibhavadi Rangsit Road','Bangkok','Thailand',1300,90,2001)
insert into Airline
values ('390','Air','Pacific','pacific@air.com','www.airpcific.com','8101 N.', 'Bank St.','Grandville',1000,85,2001)
insert into Airline
values ('258','AUSTRIA',' AIRLINES AG','info@airaustria.com','www.airaustria.com','NO.7762�','Heritage Ave','Massillon',1400,65,1999)
insert into Airline
values ('420','Hong Kong','AHK Air','hongkongair@ahk.com','www.hongkongAIR.com','681','Crescent Drive�','Bartlet',1400,100,2005)
insert into Airline
values ('399','Aeroloft Russian','Airline','airways@nippon.com','www.nipponairways.com','7886 N.','Grand Drive','New Brunswick',1600,100,1998)
insert into Airline
values ('778','Air','Niugini','airniugini@hotmail.com','www.airniugini.com','455 South','Water Dr.�','Jonasburg',700,50,2005)
insert into Airline
values ('445','ASIANA','AIRLINES INC.','air@asiana.com','www.airasiana.com','8349','Franklin St.','Jacksonville Beach',1350,85,2008)
insert into Airline
values ('198','china','Airways','airchina@info.com','www.airchina.com','158 Eagle Lane�','Highland Park','IL 60035',1800,100,1996)
insert into Airline
values ('225','Emirates','Airways','emirates@airways.com','www.emiratesa.com','Dubai�','UA','Emirates',200,150,1995)



--aircraft--

create table Aircraft
(
Airline_code varchar(50),
Aircraft_code varchar(50),
Aircraft_name varchar(50)NOT NULL,
MC varchar(50),
Max_no_of_seats int NOT NULL,
Max_no_of_model int,
City varchar(50)NOT NULL,


CONSTRAINT pk_Aircraft_code PRIMARY KEY (Aircraft_code),

CONSTRAINT fk_Airline_code1 FOREIGN KEY
(Airline_code) REFERENCES Airline (Airline_code),

)


insert into Aircraft
values('205','B666','Wright Flyer','�Aeronautica Agricola Mexicana SA',1500,3,'Tokyo')
insert into Aircraft
values('255','A434','Learjet 23','Advanced Aerodynamics and Structures Inc',1000,4,'Bankok')
insert into Aircraft
values('390','C330','Douglas DC-3','A�ro Club de Bas Armagnac',1000,5,'Grandville')
insert into Aircraft
values('258','B621','lockeed airplanes','BUild aero pvt.ltd',1200,2,'Mallison')
insert into Aircraft
values('420','BS02','Boeing B-29','�Aces High Light Aircraft Ltd�',1600,5,'Bartlet')
insert into Aircraft
values('399','AS01','Cessna 172','Ace Aircraft Manufacturing and Supply',1200,3,'Brunswick')
insert into Aircraft
values('778','BC42','Bell X-1','�Aeronautical Development Agency',1000,1,'Male')
insert into Aircraft
values('445','BD87','Autogyro','Acro Sport Inc',1000,8,'Jonasburg')
insert into Aircraft
values('198','BZ44','Enola','�AD Aerospace Ltd�',1800,1,'Beijing')
insert into Aircraft
values('225','CZ01','Boeing 747','Arab British Helicopter Company',200,'1','Arab')
 


  --flight--

 create table Flight
(
Airline_code varchar(50),
Aircraft_code varchar(50),
F_no varchar(50)NOT NULL,
F_path varchar(50),
F_type varchar(50),
DOFI date,
Estimated_time datetime,
Temp_F_num varchar(50)NOT NULL,
Duration varchar(50),

CONSTRAINT pk_F_number PRIMARY KEY (F_no),
 
CONSTRAINT fk_Airline_code2 FOREIGN KEY
(Airline_code) REFERENCES Airline (Airline_code),

CONSTRAINT fk_Aircraft_code1 FOREIGN KEY
(Aircraft_code) REFERENCES Aircraft(Aircraft_code)
)

insert into Flight
values('205','B666','AN1','From Tokyo to Srilanka','Boeing 787-9','01.11.2010',getdate(),'T001','8hrs')
insert into Flight
values('255','A434','AC6','From Bankok to Srilanka','Boeing 777-300ER','01.11.2004',getdate(),'T002','5hrs')
insert into Flight
values('390','C330','AC2','From Thailand to Srilanka','Boeing 787-01','10.01.2012',getdate(),'T003','7hrs')
insert into Flight
values('258','B621','AC1','From Austria to Srilanka','Boeing 787-9','10.12.2002',getdate(),'T004','8hrs')
insert into Flight
values('420','BS02','A21','From Srilanka to Thailand','Airbus A330-200','01.09.2003',getdate(),'T005','7hrs')
insert into Flight
values('399','AS01','AZ1','From Srilanka to Newyork','A350-9000','05.10.2009',getdate(),'T006','10hrs')
insert into Flight
values('778','BC42','AI1','From Australia to Srilanka','Boeing 747-9','01.01.2015',getdate(),'T007','8hrs')
insert into Flight
values('445','BD87','AK1','From Malaysia to Srilanka','Boeing 757-8','10.10.2015',getdate(),'T008','5hrs')
insert into Flight
values('198','BZ44','AN5','From Beijing to Srilanka','Airbus A330-300','01.01.2013',getdate(),'T009','7hrs')
insert into Flight
values('225','CZ01','BI5','From Beijing to Srilanka','Airbus A330-300','01.01.2013',getdate(),'T009','7hrs')



--aircrew--

create table Aircrew
(
Airline_code varchar(50),
Passport_num varchar(100)NOT NULL,
Staff_ID varchar(50)NOT NULL,
Emp_details varchar(100),
Joined_date date,
Designation varchar(50)NOT NULL,
Salary int NOT NULL,

CONSTRAINT pk_Staff_ID PRIMARY KEY (Staff_ID),

CONSTRAINT fk_Airline_code3 FOREIGN KEY
(Airline_code) REFERENCES Airline (Airline_code),

CONSTRAINT uq_Passprt_num UNIQUE(Passport_num) 
)

insert into Aircrew
values('205','2425332v','SI01','James Andrew','10.10.1998','captain',100000)
insert into Aircrew
values('255','2425333v','SI02','Jhon Mathew','10.10.1998','pilot in command',70000)
insert into Aircrew
values('390','2425334v','SI03','Peter Ross','01.01.2000','1st officer',85000)
insert into Aircrew
values('258','2425335v','SI04','Tim Bergling','01.01.2000','2nd officer',80000)
insert into Aircrew
values('420','2425336v','SI05','Calvin Browns','01.01.2002','flight engineer',90000)
insert into Aircrew
values('399','2425337v','SI06','Monika evis','01.01.2005','air hostress',75000)
insert into Aircrew
values('778','2425338v','SI07','Betty Cooper','01.01.2008','air hostress',75000)
insert into Aircrew
values('445','2425339v','SI08','Veronica James','01.01.2008','air hostress',75000)
insert into Aircrew
values('198','2425340v','SI09','Sussy Ann','01.01.2009','air hostress',75000)
insert into Aircrew
values('225','2425341v','SI10','Lili Reinhart','01.01.2010','air hostress',75000)



--airport--

create table Airport
(
Airline_code varchar(50),
Airport_code varchar(50),
name varchar(100) NOT NULL,
Gate_num varchar(50)NOT NULL,
Established_year int,
Country varchar(100),
City varchar(50) NOT NULL,

CONSTRAINT pk_Airport_code PRIMARY KEY (Airport_code),

CONSTRAINT fk_Airline_code4 FOREIGN KEY
(Airline_code) REFERENCES Airline (Airline_code),
)

insert into Airport
values('205','AP01','Annette Island','G1','1980','Mexico','Mexico')
insert into Airport
values('255','AP02','Angoche','G2','1980','Japan','Tokyo')
insert into Airport
values('390','AP03','Tri-State Steuben City','G3','1988','Thailand','Bankok')
insert into Airport
values('258','AP04','Andahuaylas','G4','1990','Austria','Vienna')
insert into Airport
values('420','AP05','St. Anton','G5','1992','Fiji','Suva')
insert into Airport
values('399','AP06','V.C. Bird International Airport','G6','1984','Russia','Moscow')
insert into Airport
values('778','AP07','Anthony Airport','G7','1995','Niugini','Moresbe')
insert into Airport
values('445','AP08','Angus Downs','G8','1998','Japan','Tokyo')
insert into Airport
values('198','AP09','Lee Airport','G9','2000','Chiuna','Beijing')
insert into Airport
values('225','AP10','Allen County','G10','2001','Korea','Seoul')


--passenger--

create table Passenger
(
P_no varchar(50),
F_name char(50)NOT NULL,
L_name char(50)NOT NULL,
Nationality char(100),
DOB date,
Gender char(10),
Pass_ex_issue_date date NOT NULL,
Pass_ex_exp_date date NOT NULL,


CONSTRAINT pk_P_no PRIMARY KEY (P_no),

CONSTRAINT chk_Gender CHECK
(Gender='Male' OR Gender='Female')

)

insert into Passenger
values('60754320v','Hasitha','Epitawala','Srilankan','10.09.1997','Male','01.01.2018','01.12.2018')
insert into Passenger
values('60754321v','Eshan','Perera','Srilankan','07.09.1996','Male','01.05.2018','01.12.2018')
insert into Passenger
values('60754322v','Jughead','Jhons','American','10.09.1990','Male','01.01.2018','01.12.2018')
insert into Passenger
values('60754323v','Camila','Mendes','British','10.10.1995','Female','01.06.2018','01.12.2018')
insert into Passenger
values('60754324v','Mathew','Haiden','Australian','05.16.1990','Male','04.01.2018','01.12.2018')
insert into Passenger
values('60754325v','Tim','Southee','British','10.08.1988','Male','01.03.2018','01.12.2018')
insert into Passenger
values('60754326v','Hailee','Bieber','American','10.09.1997','Female','01.07.2018','01.12.2018')
insert into Passenger
values('60754327v','Kim','Kaira','Chinese','01.01.2000','Female','01.05.2018','04.12.2018')
insert into Passenger
values('60754328v','Kylie','Jenner','Austria','10.07.1988','Male','09.01.2018','01.12.2018')
insert into Passenger
values('60754329v','Lee','Jun','Malaysian','10.01.1989','Female','01.11.2018','01.05.2019')



--flight leg arrival--

create table Flight_leg_arrival
(
F_no varchar(50),
Leg_no varchar(20),
Actual_time time NOT NULL,
Terminal_no varchar(50),
Flight_type varchar(100),
Date_of_Flight date NOT NULL,
B_b_num varchar(20),
Status varchar(100)NOT NULL,

CONSTRAINT pk_Leg_no PRIMARY KEY (Leg_no),

CONSTRAINT fk_F_no1 FOREIGN KEY
(F_no) REFERENCES Flight(F_no),

CONSTRAINT uq_B_b_num UNIQUE(B_b_num)
)


insert into Flight_leg_arrival
values('AN1','ALG01',GETDATE(),'T1','Arrival',GETDATE(),'BELT1','check-in')
insert into Flight_leg_arrival
values('AC6','ALG02',GETDATE(),'T2','Arrival',GETDATE(),'BELT2','boarding')
insert into Flight_leg_arrival
values('AC2','ALG03',GETDATE(),'T3','Arrival',GETDATE(),'BELT3','boarding')
insert into Flight_leg_arrival
values('AC1','ALG04',GETDATE(),'T4','Arrival',GETDATE(),'BELT4','on-air')
insert into Flight_leg_arrival
values('A21','ALG05',GETDATE(),'T5','Arrival',GETDATE(),'BELT5','arrived')
insert into Flight_leg_arrival
values('AZ1','ALG06',GETDATE(),'T6','Arrival',GETDATE(),'BELT6','arrived')
insert into Flight_leg_arrival
values('AI1','ALG07',GETDATE(),'T7','Arrival',GETDATE(),'BELT7','canceled')
insert into Flight_leg_arrival
values('AK1','ALG08',GETDATE(),'T8','Arrival',GETDATE(),'BELT8','delayed')
insert into Flight_leg_arrival
values('AN5','ALG09',GETDATE(),'T9','Arrival',GETDATE(),'BELT9','delayed')
insert into Flight_leg_arrival
values('BI5','ALG10',GETDATE(),'T10','Arrival',GETDATE(),'BELT10','on-air')


--flight leg departure--

create table Flight_leg_departure
(
F_no varchar(50),
Leg_no varchar(20),
Actual_time time NOT NULL,
Terminal_no varchar(50),
Flight_type varchar(100),
Date_of_Flight date NOT NULL,
Boarding_time time,
Status varchar(100)NOT NULL,

CONSTRAINT fk_F_no2 FOREIGN KEY
(F_no) REFERENCES Flight(F_no)

)


insert into Flight_leg_departure
values('AN1','DLG01',GETDATE(),'T1','Depature',GETDATE(),GETDATE(),'arrived')
insert into Flight_leg_departure
values('AC6','DLG02',GETDATE(),'T2','Depature',GETDATE(),GETDATE(),'delayed')
insert into Flight_leg_departure
values('AC2','DLG03',GETDATE(),'T3','Depature',GETDATE(),GETDATE(),'on-air')
insert into Flight_leg_departure
values('AC1','DLG04',GETDATE(),'T4','Depature',GETDATE(),GETDATE(),'on-air')
insert into Flight_leg_departure
values('A21','DLG05',GETDATE(),'T5','Depature',GETDATE(),GETDATE(),'canceled')
insert into Flight_leg_departure
values('AZ1','DLG06',GETDATE(),'T6','Depature',GETDATE(),GETDATE(),'arrived')
insert into Flight_leg_departure
values('AI1','DLG07',GETDATE(),'T7','Depature',GETDATE(),GETDATE(),'check-in')
insert into Flight_leg_departure
values('AK1','DLG08',GETDATE(),'T8','Depature',GETDATE(),GETDATE(),'boarding')
insert into Flight_leg_departure
values('AN5','DLG09',GETDATE(),'T9','Depature',GETDATE(),GETDATE(),'arrived')
insert into Flight_leg_departure
values('BI5','DLG10',GETDATE(),'T10','Depature',GETDATE(),GETDATE(),'on-air')



--reservation--

create table Reservation
(
P_no varchar(50),
Leg_no varchar(20),
Res_no varchar(50),
Checkin_time time NOT NULL,
B_weight varchar(50)NOT NULL,
S_no varchar(10) NOT NULL,

CONSTRAINT pk_Res_no PRIMARY KEY (RES_no),

CONSTRAINT fk_P_no1 FOREIGN KEY
(P_no) REFERENCES Passenger(P_no),

CONSTRAINT fk_Leg_no2 FOREIGN KEY
(Leg_no) REFERENCES Flight_leg_arrival(Leg_no),
 
CONSTRAINT uq_S_no UNIQUE(S_no)
)

insert into Reservation
values('60754320v','ALG01','R01',GETDATE(),'50kg','S001')
insert into Reservation
values('60754321v','ALG02','R02',GETDATE(),'50kg','S002')
insert into Reservation
values('60754322v','ALG03','R03',GETDATE(),'30kg','S003')
insert into Reservation
values('60754323v','ALG04','R04',GETDATE(),'48kg','S004')
insert into Reservation
values('60754324v','ALG05','R05',GETDATE(),'38kg','S005')
insert into Reservation
values('60754325v','ALG06','R06',GETDATE(),'20kg','S006')
insert into Reservation
values('60754326v','ALG07','R07',GETDATE(),'50kg','S007')
insert into Reservation
values('60754327v','ALG08','R08',GETDATE(),'40kg','S008')
insert into Reservation
values('60754328v','ALG09','R09',GETDATE(),'32kg','S009')
insert into Reservation
values('60754329v','ALG10','R10',GETDATE(),'22kg','S010')



--special req--

create table Special_req
(
 P_no varchar(50),
 Req_name char(50),
 
CONSTRAINT fk_P_no2 FOREIGN KEY
(P_no) REFERENCES Passenger(P_no)
)

insert into Special_req
values('60754320v','Haitha')
insert into  Special_req
values('60754321v','Eshan')
insert into  Special_req
values('60754322v','Jug')
insert into Special_req
values('60754323v','Camila')
insert into Special_req
values('60754324v','Mathew')
insert into Special_req
values('60754325v','Tim')
insert into Special_req
values('60754326v','Hailee')
insert into Special_req
values('60754327v','kim')
insert into Special_req
values('60754328v','Kylie')
insert into Special_req
values('60754329v','Saumya')



--airline contact no--


create table Airline_contact_Number
(
Airline_code varchar(50),
Contact_no varchar(30)NOT NULL,

CONSTRAINT fk_Airline_code5 FOREIGN KEY
(Airline_code) REFERENCES Airline (Airline_code)
)

insert into Airline_contact_number
values('205','+61 2 8222 2430')
insert into Airline_contact_number
values('255','+61 2 8222 2431')
insert into Airline_contact_number
values('390','+61 2 8222 2432')
insert into Airline_contact_number
values('258','+61 2 8222 2433')
insert into Airline_contact_number
values('420','+61 2 8222 2434')
insert into Airline_contact_number
values('399','+61 2 8222 2435')
insert into Airline_contact_number
values('778','+61 2 8222 2436')
insert into Airline_contact_number
values('445','+61 2 8222 2437')
insert into Airline_contact_number
values('198','+61 2 8222 2438')
insert into Airline_contact_number
values('225','+61 2 8222 2439')


--flight destination--

create table Flight_destination
(
F_no varchar(50),
Destination varchar(50)NOT NULL,

CONSTRAINT fk_F_no3 FOREIGN KEY
(F_no) REFERENCES Flight(F_no),
 
)

insert into Flight_destination
values('AN1','Srilanka')
insert into Flight_destination
values('AC6','Srilanka')
insert into Flight_destination
values('AC2','Srilanka')
insert into Flight_destination
values('AC1','Srilanka')
insert into Flight_destination
values('A21','Thailand')
insert into Flight_destination
values('AZ1','Newyork')
insert into Flight_destination
values('AI1','Srilanka')
insert into Flight_destination
values('AK1','Srilanka')
insert into Flight_destination
values('AN5','Srilanka')
insert into Flight_destination
values('BI5','Srilanka')


--aircrew p2--

create table Aircrew_P2
(
 
staff_ID varchar(50),
qulification varchar(100),
work_exp varchar(100),

CONSTRAINT fk_Aircrew1 FOREIGN KEY
(Staff_ID) REFERENCES Aircrew (Staff_ID)
)

insert into Aircrew_P2
values('SI01','Airline pilot in USA','20yrs')
insert into Aircrew_P2
values('SI02','Airline pilot in AUS','20yrs')
insert into Aircrew_P2
values('SI03','Sri Lanaka Airline cabin crew ','10yrs')
insert into Aircrew_P2
values('SI04','Sri Lanaka Airline cabin crew ','10yrs')
insert into Aircrew_P2
values('SI05','Ground Test Engineer - ATDC','20yrs')
insert into Aircrew_P2
values('SI06','Ground Test Engineer - ATDC','12yrs')
insert into Aircrew_P2
values('SI07','Cabin Crew Instructor - ATDC','18yrs')
insert into Aircrew_P2
values('SI08','Cabin Crew Instructor - ATDC','5yrs')
insert into Aircrew_P2
values('SI09','Sri Lanaka Airline cabin crew','8yrs')
insert into Aircrew_P2
values('SI10','Sri Lanaka Airline cabin crew ','2yrs')



--many to many--

create table Many_to_many
(
Aircraft_code varchar(50),
Airport_code varchar(50),


CONSTRAINT fk_Aircraft1 FOREIGN KEY
(Aircraft_code) REFERENCES Aircraft(Aircraft_code),

CONSTRAINT fk_Airport1 FOREIGN KEY
(Airport_code) REFERENCES Airport(Airport_code)

)

insert into Many_to_many
values('B666','AP01')
insert into Many_to_many
values('A434','AP02')
insert into Many_to_many
values('C330','AP03')
insert into Many_to_many
values('B621','AP04')
insert into Many_to_many
values('BS02','AP05')
insert into Many_to_many
values('AS01','AP06')
insert into Many_to_many
values('BC42','AP07')
insert into Many_to_many
values('BD87','AP08')
insert into Many_to_many
values('BZ44','AP09')
insert into Many_to_many
values('CZ01','AP10')

