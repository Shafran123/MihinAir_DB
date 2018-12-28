Alter Procedure spBoarding_Pass(@P_No Varchar(50),
                                @F_Name char(50) OUT,
                                @L_Name char(50) OUT,
                                @Leg_No varchar(20) OUT,
                                @Seat_No varchar(10) OUT,
                                @Check_In_Time time OUT,
                                @Flight_Type varchar(100) OUT,
                                @Terminal_No varchar(50) OUT,
                                @Flight_No varchar(50) OUT,
                                @Airline_Code varchar(50) OUT,
                                @Flight_Path varchar(50) OUT,
                                @Aircraft_Name varchar(50) OUT)
AS
BEGIN

Declare @FName CHAR(50),
        @LName CHAR(50),
        @LegNo Varchar(20),
        @SeatNo Varchar(10),
        @CheckInTime TIME(7),
        @FlightType VARCHAR(100),
        @TerminalNo VARCHAR(50),
        @FlightNo VARCHAR(50),
        @AirlineCode VARCHAR(50),
        @FlightPath VARCHAR(50),
        @AircraftName VARCHAR(50)

select 
        @FName= dbo.Passenger.F_name,
        @LName= dbo.Passenger.L_name,
        @LegNo=dbo.Reservation.Leg_no,
        @SeatNo=dbo.Reservation.S_no,
        @CheckInTime=dbo.Reservation.Checkin_time,
        @FlightType=dbo.Flight_leg_arrival.Flight_type,
        @TerminalNo=dbo.Flight_leg_arrival.Terminal_no,
        @FlightNo=dbo.Flight_leg_arrival.F_no,
        @AirlineCode=dbo.Flight.Airline_code,
        @FlightPath=dbo.Flight.F_path,
        @AircraftName=dbo.Aircraft.Aircraft_name
from
dbo.Passenger
INNER JOIN dbo.Reservation ON dbo.Passenger.P_no=dbo.Reservation.P_no

INNER JOIN dbo.Flight_leg_arrival ON dbo.Flight_leg_arrival.Leg_no=dbo.Reservation.Leg_no

INNER JOIN dbo.Flight_destination ON dbo.Flight_destination.F_no=dbo.Flight_leg_arrival.F_no

INNER JOIN dbo.Flight ON dbo.Flight_leg_arrival.F_no=dbo.Flight.F_no

INNER JOIN dbo.Aircraft ON dbo.Flight.Airline_code=dbo.Aircraft.Airline_code

WHERE dbo.Passenger.P_no=@P_No

Set @F_Name=@FName
Set @L_Name=@LName
Set @Leg_No=@LegNo
Set @Seat_No=@SeatNo
Set @Check_In_Time=@CheckInTime
Set @Flight_Type=@FlightType
Set @Terminal_No=@TerminalNo
Set @Flight_No=@FlightNo
Set @Airline_Code=@AirlineCode
Set @Flight_Path=@FlightPath
Set @Aircraft_Name=@AircraftName

END

OUTPUT:

Declare @bind_f_name CHAR(50),
        @bind_l_name CHAR(50),
        @bind_leg_no VARCHAR(20),
        @bind_seat_no VARCHAR(10),
        @bind_check_in_time time(7),
        @bind_flight_type VARCHAR(100),
        @bind_terminal_no VARCHAR(50),
        @bind_flight_no VARCHAR(50),
        @bind_airline_code VARCHAR(50),
        @bind_flight_path VARCHAR(50),
        @bind_aircraft_name VARCHAR(50)

EXEC spBoarding_Pass '60754320v',   @bind_f_name OUT,
                                    @bind_l_name OUT,
                                    @bind_leg_no OUT,@bind_seat_no OUT,
                                    @bind_check_in_time OUT,
                                    @bind_flight_type OUT,
                                    @bind_terminal_no OUT,
                                    @bind_flight_no OUT,
                                    @bind_airline_code OUT,
                                    @bind_flight_path OUT,
                                    @bind_aircraft_name OUT

Print '    Boarding Pass     '
Print '----------------------'

Print 'Passenger Name : '+Cast(@bind_f_name AS CHAR)+''+Cast(@bind_l_name AS CHAR)
Print 'Leg No : ' + Cast(@bind_leg_no as varchar)
Print 'Seat No: ' + Cast(@bind_seat_no as varchar)
Print 'Check In Time : ' + Cast(@bind_check_in_time as char)
Print 'Type : ' + Cast(@bind_flight_type as char)
Print 'Teminal No : ' + Cast(@bind_terminal_no as char)
Print 'Flight No : ' + Cast(@bind_flight_no as char)
Print 'Airline Code : ' + Cast(@bind_airline_code as char)
Print 'Trip : ' + Cast(@bind_flight_path as char)
Print 'Flight Name : ' + Cast(@bind_aircraft_name as char)