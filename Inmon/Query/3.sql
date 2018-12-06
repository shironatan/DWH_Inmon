use Inmon_DM3;
SELECT Category.Category1_name AS 原作分類, Date.Term AS クール, Stories.Term_number AS クール数, SUM(Sale_number_count) AS 作品数, TRUNCATE(AVG(Sale_number),0) AS 売上数値平均
FROM Sale
INNER JOIN Category ON Sale.Category_key = Category.Category_key
INNER JOIN Date ON Sale.Date_key = Date.Date_key
INNER JOIN Stories ON Sale.Stories_key = Stories.Stories_key
GROUP BY 原作分類, クール, クール数
ORDER BY 売上数値平均 desc;
