INSERT INTO Date(Date.Month,Date.Day,Date.Day_week,Date.Term)
        SELECT test_inmon2.Date.Month, test_inmon2.Date.Day, test_inmon2.Date.Week_day, test_inmon2.Date.Term
        FROM test_inmon2.Date;

