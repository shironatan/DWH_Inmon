use Inmon_DM1;
SELECT D1.Day_week AS 放送曜日,SUM(F.Sale_number_count) AS 作品数, TRUNCATE(SUM(F.Sale_number)/SUM(F.Sale_number_count),0) AS 売上数値平均 FROM Sale F
INNER JOIN Date D1
 ON F.Date_key = D1.Date_key
GROUP BY 放送曜日
ORDER BY CASE 放送曜日
 WHEN '月' THEN 1
 WHEN '火' THEN 2
 WHEN '水' THEN 3
 WHEN '木' THEN 4
 WHEN '金' THEN 5
 WHEN '土' THEN 6
 WHEN '日' THEN 7
 END ASC;
