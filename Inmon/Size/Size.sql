SELECT
	table_schema, ROUND(SUM(data_length + index_length) / 1024, 1) AS 'size(KB)'
	FROM
		information_schema.tables
	WHERE
		table_schema = 'Inmon_DWH'
		OR
		table_schema = 'Inmon_DM1'
		OR
		table_schema = 'Inmon_DM2'
		OR
		table_schema = 'Inmon_DM3'
	GROUP BY
		table_schema;
