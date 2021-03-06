--VIEWS--

--arrival schedule--

CREATE VIEW arrival_schedule
([F_no],[Leg_no],[F_path],[Actual_time])
AS
SELECT F.F_no,FLA.Leg_no,F.F_path,FLA.Actual_time
FROM Flight F INNER JOIN Flight_leg_arrival FLA  
ON F.F_no = FLA.F_no
WHERE F.F_no=FLA.F_no

--departure schedule--

CREATE VIEW departure_schedule
([F_no],[Leg_no],[F_path],[Actual_time])
AS
SELECT F.F_no,FLD.Leg_no,F.F_path,FLD.Actual_time
FROM Flight F INNER JOIN Flight_leg_departure FLD  
ON F.F_no = FLD.F_no
WHERE F.F_no=FLD.F_no


--seat no--

CREATE VIEW seat_no
([P_no],[Full_name],[S_no],[Leg_no])
AS
SELECT P.P_no,(P.F_name + ' ' + P.L_name),R.S_no,R.Leg_no
FROM Passenger P INNER JOIN Reservation R
ON P.P_no = R.P_no
WHERE P.P_no = R.P_no


