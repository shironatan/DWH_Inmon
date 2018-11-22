INSERT INTO Sale(Date_key,Sale_number,Sale_number_count)
SELECT Date_key,SUM(test_inmon2.Sale.Sale_number),COUNT(test_inmon2.Sale.Sale_number) FROM Date, test_inmon2.Sale
WHERE
Date.Month = test_inmon2.Sale.Month
AND
Date.Day = test_inmon2.Sale.Day
GROUP BY Date_key;
