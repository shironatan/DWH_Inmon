INSERT INTO Date(Date.Month,Date.Day,Date.Day_week,Date.Term)
        SELECT Inmon_DWH.Date.Month, Inmon_DWH.Date.Day, Inmon_DWH.Date.Week_day, Inmon_DWH.Date.Term
        FROM Inmon_DWH.Date;

