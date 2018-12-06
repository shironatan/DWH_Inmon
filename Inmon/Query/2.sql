use Inmon_DM2;
SELECT Category.Category1_name AS 原作分類, Official_tweet.Tweet AS ツイート数, SUM(Sale_number_count) AS 作品数, TRUNCATE(AVG(Sale_number),0) AS 売上数値平均
FROM Sale
INNER JOIN Category ON Sale.Category_key = Category.Category_key
INNER JOIN Official_tweet ON Sale.Official_tweet_key = Official_tweet.Official_tweet_key
GROUP BY 原作分類, ツイート数
ORDER BY 売上数値平均 desc;
