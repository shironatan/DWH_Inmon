use Inmon_DM2;
SELECT D1.Category1_name AS 原作分類,D2.Tweet AS ツイート端数,
 SUM(F.Sale_number_count) AS 作品数, TRUNCATE(AVG(F.Sale_number),0) AS 売上数値平均 FROM Sale F
INNER JOIN Category D1
	ON F.Category_key = D1.Category_key
INNER JOIN Official_tweet D2
	ON F.Official_tweet_key = D2.Official_tweet_key
GROUP BY D1.Category1_name,D2.Tweet
ORDER BY 売上数値平均 DESC;
