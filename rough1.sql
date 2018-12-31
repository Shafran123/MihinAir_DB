select 
        dbo.Passenger.P_no,
        F_name,L_name,
        Pass_ex_issue_date,
        Pass_ex_exp_date,
        dbo.Reservation.Leg_no,
        dbo.Reservation.S_no,
        dbo.Reservation.B_weight,
        dbo.Reservation.Checkin_time,
        
        --dbo.Flight_leg_arrival.Leg_no,
        dbo.Flight_leg_arrival.Flight_type,
        dbo.Flight_leg_arrival.[Status],
        dbo.Flight_leg_arrival.Terminal_no,
        dbo.Flight_leg_arrival.F_no,
        
        dbo.Flight_destination.Destination,

        dbo.Flight.Airline_code,
        dbo.Flight.F_path,

        dbo.Aircraft.Aircraft_name
from
dbo.Passenger
INNER JOIN dbo.Reservation ON dbo.Passenger.P_no=dbo.Reservation.P_no

INNER JOIN dbo.Flight_leg_arrival ON dbo.Flight_leg_arrival.Leg_no=dbo.Reservation.Leg_no

INNER JOIN dbo.Flight_destination ON dbo.Flight_destination.F_no=dbo.Flight_leg_arrival.F_no

INNER JOIN dbo.Flight ON dbo.Flight_leg_arrival.F_no=dbo.Flight.F_no

INNER JOIN dbo.Aircraft ON dbo.Flight.Airline_code=dbo.Aircraft.Airline_code

--WHERE dbo.Passenger.P_no='60754320v';