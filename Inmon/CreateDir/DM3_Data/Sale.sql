INSERT INTO Sale(Category_key,Stories_key,Sale_number,Sale_number_count)
SELECT Category_key,Stories_key,SUM(test_inmon2.Sale.Sale_number),COUNT(test_inmon2.Sale.Sale_number)
 FROM Category,Stories,test_inmon2.Sale
WHERE
 test_inmon2.Sale.Category1_code = Category.Category1_code
 AND
 test_inmon2.Sale.Category2_code = Category.Category2_code
 AND
 test_inmon2.Sale.Stories_number = Stories.Stories_number
GROUP BY Category_key,Stories_key;
