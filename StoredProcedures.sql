SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedure 1: Get the full dashboard 
CREATE PROCEDURE [dbo].[sp_GetTaskBoard]
AS
BEGIN
    SELECT 
        T.TaskName, 
        T.Status, 
        T.Priority, 
        T.DueDate, 
        E.FullName AS Assigned_To
    FROM Tasks AS T
    JOIN Employees AS E ON T.AssignedTo = E.EmployeeID
    ORDER BY T.DueDate ASC;
END;
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure 2: Add a new task (Write to DB)
CREATE PROCEDURE [dbo].[sp_AddTask]
    @ID int,
    @Name varchar(100),
    @Status varchar(20),
    @Priority varchar(10),
    @Date date,
    @EmpID int
AS
BEGIN
    INSERT INTO Tasks (TaskID, TaskName, Status, Priority, DueDate, AssignedTo)
    VALUES (@ID, @Name, @Status, @Priority, @Date, @EmpID);
END;
GO
