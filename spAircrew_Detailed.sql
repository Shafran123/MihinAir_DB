CREATE PROCEDURE spAircrew_Detailed @Staff_ID varchar(50)

AS

BEGIN

select 
        dbo.Aircrew.Staff_ID,
        dbo.Aircrew.Emp_details,
        dbo.Aircrew.Joined_date,
        dbo.Aircrew.Passport_num,
        dbo.Aircrew.Designation,
        dbo.Aircrew.Salary,

        dbo.Aircrew_P2.qulification,
        dbo.Aircrew_P2.work_exp
from
        dbo.Aircrew
Inner JOIN dbo.Aircrew_P2  on dbo.Aircrew.Staff_ID=dbo.Aircrew_P2.staff_ID

WHERE dbo.Aircrew.Staff_ID=@Staff_ID

END

EXEC spAircrew_Detailed @Staff_ID='SI02'