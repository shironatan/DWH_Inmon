use Inmon_DM1;
SELECT Date.Day_week AS 曜日, SUM(Sale_number_count) AS 作品数, TRUNCATE(AVG(Sale_number),0) AS 売上数値平均
FROM Sale
INNER JOIN Date ON Sale.Date_key = Date.Date_key
GROUP BY 曜日
ORDER BY 売上数値平均 desc;
