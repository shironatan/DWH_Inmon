INSERT INTO Category(Category.Category1_code,Category.Category1_name,Category.Category2_code,Category.Category2_name)
SELECT test_inmon2.Category.Category1_code,test_inmon2.Category1.Category1_name,test_inmon2.Category2.Category2_code,test_inmon2.Category2.Category2_name
FROM test_inmon2.Category
LEFT OUTER JOIN test_inmon2.Category1
	ON test_inmon2.Category.Category1_code = test_inmon2.Category1.Category1_code
LEFT OUTER JOIN test_inmon2.Category2
	ON test_inmon2.Category.Category2_code = test_inmon2.Category2.Category2_code;
