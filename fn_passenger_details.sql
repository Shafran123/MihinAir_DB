alter Function fn_passenger_details(
   
    @fromdate date,
    @todate date

)

RETURNS @table TABLE(
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(50),
    Reservataion VARCHAR(50),
    Seat VARCHAR(50),
    Fno VARCHAR(50),
    Date_of date
)
AS
BEGIN
    INSERT INTO @table
    --query
    select 
        dbo.Passenger.F_name,
        dbo.Passenger.L_name,
        dbo.Passenger.Gender,

        dbo.Reservation.Res_no,
        dbo.Reservation.S_no,

        dbo.Flight_leg_arrival.F_no,
        dbo.Flight_leg_arrival.Date_of_Flight
        


FROM
    dbo.Passenger

inner join dbo.Reservation on dbo.Passenger.P_no = dbo.Reservation.P_no

Inner Join dbo.Flight_leg_arrival on dbo.Reservation.Leg_no=dbo.Flight_leg_arrival.Leg_no



WHERE dbo.Flight_leg_arrival.Date_of_Flight

BETWEEN @fromdate and @todate
      
    RETURN
END

GO
--Exucute Function GetInfo--
 SELECT *
 From
  dbo.fn_passenger_details('2018/12/01','2018/12/30')
  ---------------------------------
