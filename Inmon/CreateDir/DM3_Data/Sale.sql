INSERT INTO Sale(Category_key,Stories_key,Sale_number,Sale_number_count)
SELECT Category_key,Stories_key,SUM(Inmon_DWH.Sale.Sale_number),COUNT(Inmon_DWH.Sale.Sale_number)
 FROM Category,Stories,Inmon_DWH.Sale
WHERE
 Inmon_DWH.Sale.Category1_code = Category.Category1_code
 AND
 Inmon_DWH.Sale.Category2_code = Category.Category2_code
 AND
 Inmon_DWH.Sale.Stories_number = Stories.Stories_number
GROUP BY Category_key,Stories_key;
