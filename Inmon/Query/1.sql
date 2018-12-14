use Inmon_DM1;
SELECT Date.Day_week AS 曜日, SUM(Sale_number_count) AS 作品数, TRUNCATE(AVG(Sale_number),0) AS 売上数値平均
FROM Sale
INNER JOIN Date ON Sale.Date_key = Date.Date_key
GROUP BY 曜日
ORDER BY 売上数値平均 desc;
use Inmon_DM2;
SELECT Category.Category1_name AS 原作分類, Official_tweet.Tweet AS ツイート数, SUM(Sale_number_count) AS 作品数, TRUNCATE(AVG(Sale_number),0) AS 売上数値平均
FROM Sale
INNER JOIN Category ON Sale.Category_key = Category.Category_key
INNER JOIN Official_tweet ON Sale.Official_tweet_key = Official_tweet.Official_tweet_key
GROUP BY 原作分類, ツイート数
ORDER BY 売上数値平均 desc;
use Inmon_DM3;
SELECT Category.Category1_name AS 原作分類, Date.Term AS クール, Stories.Term_number AS クール数, SUM(Sale_number_count) AS 作品数, TRUNCATE(AVG(Sale_number),0) AS 売上数値平均
FROM Sale
INNER JOIN Category ON Sale.Category_key = Category.Category_key
INNER JOIN Date ON Sale.Date_key = Date.Date_key
INNER JOIN Stories ON Sale.Stories_key = Stories.Stories_key
GROUP BY 原作分類, クール, クール数
ORDER BY 売上数値平均 desc;
