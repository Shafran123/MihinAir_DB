CREATE PROCEDURE spCoustomer_Resvelation_Details @P_NO varchar(50)

AS

BEGIN

select 
        dbo.Passenger.P_no,
        dbo.Passenger.F_name,
        dbo.Passenger.L_name,
        dbo.Reservation.Res_no,
        dbo.Reservation.Leg_no,
        dbo.Reservation.Checkin_time,
        dbo.Reservation.B_weight
FROM
        Passenger

INNER JOIN dbo.Reservation ON dbo.Passenger.P_no=dbo.Reservation.P_no

WHERE dbo.Passenger.P_no=@P_NO

END

EXEC spCoustomer_Resvelation_Details @P_NO='60754320v'