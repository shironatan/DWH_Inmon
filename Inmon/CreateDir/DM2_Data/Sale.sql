INSERT INTO Sale(Category_key,Official_tweet_key,Sale_number,Sale_number_count)
SELECT Category_key,Official_tweet_key,SUM(test_inmon2.Sale.Sale_number),COUNT(test_inmon2.Sale.Sale_number)
 FROM Category,Official_tweet, test_inmon2.Sale
WHERE
 test_inmon2.Sale.Category1_code = Category.Category1_code
 AND
 test_inmon2.Sale.Category2_code = Category.Category2_code
 AND
 test_inmon2.Sale.Official_tweet = Official_tweet.Official_tweet_number
GROUP BY Category_key,Official_tweet_key;
