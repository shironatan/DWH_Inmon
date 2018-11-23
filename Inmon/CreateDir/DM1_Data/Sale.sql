INSERT INTO Sale(Date_key,Sale_number,Sale_number_count)
SELECT Date_key,SUM(Inmon_DWH.Sale.Sale_number),COUNT(Inmon_DWH.Sale.Sale_number) FROM Date, Inmon_DWH.Sale
WHERE
Date.Month = Inmon_DWH.Sale.Month
AND
Date.Day = Inmon_DWH.Sale.Day
GROUP BY Date_key;
