INSERT INTO Category(Category.Category1_code,Category.Category1_name,Category.Category2_code,Category.Category2_name)
SELECT Inmon_DWH.Category.Category1_code,Inmon_DWH.Category1.Category1_name,Inmon_DWH.Category2.Category2_code,Inmon_DWH.Category2.Category2_name
FROM Inmon_DWH.Category
LEFT OUTER JOIN Inmon_DWH.Category1
        ON Inmon_DWH.Category.Category1_code = Inmon_DWH.Category1.Category1_code
LEFT OUTER JOIN Inmon_DWH.Category2
        ON Inmon_DWH.Category.Category2_code = Inmon_DWH.Category2.Category2_code; 
