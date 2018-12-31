--User Define Function--

USE MihinairDB
GO
---------------------------------
--Function GetInfo--

--Used to get relavant airline details form ariline code--


CREATE Function GetInfo(
    @Airline_code INT  
)
RETURNS @table TABLE(
    Airline_code VARCHAR(50),
    Flight_Path VARCHAR(50),
    Date_of_Journey date
)
AS
BEGIN
    INSERT INTO @table
    Select 
        Airline_code,
        F_path,
        DOFI
    From
        dbo.Flight
    Where
        Airline_code= @Airline_code
    RETURN
END

go

--Exucute Function GetInfo--
 SELECT *
 From
  dbo.GetInfo(258)

---------------------------------
