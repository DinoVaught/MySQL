DROP PROCEDURE IF EXISTS mes.Get_Auto_Mode_By_Shift;
CREATE PROCEDURE mes.Get_Auto_Mode_By_Shift(IN qryDate varchar(20))
BEGIN
	
--  C:\Data\Dev\MySQL\StoredProcedures
--  CALL debug_msg_log('', '', '');

	  DECLARE start_date VARCHAR(50);
	  DECLARE end_date VARCHAR(50);	
	
    SET start_date = CONCAT(SUBDATE(qryDate, INTERVAL 1 DAY), ' 23:00');
    SET end_date = CONCAT(qryDate, ' 22:59');

    -- CALL debug_msg_log('****', start_date, end_date);

	SELECT CASE WHEN HOUR(created) IN(0, 1, 2, 3, 4, 5, 6, 23) THEN '3'
				WHEN HOUR(created) IN(7, 8, 9, 10, 11, 12, 13, 14) THEN '1'
				WHEN HOUR(created) IN(15, 16, 17, 18, 19, 20, 21, 22) THEN '2'
		   END AS 'Shift',
			val_1 as 'Machine',
		   TRUNCATE(SUM(TIMESTAMPDIFF(SECOND, created, date_1) / 60), 2)  as 'Minutes',
		   TRUNCATE(SUM(TIMESTAMPDIFF(SECOND, created, date_1) / 60 / 60), 2)  as 'Hours'
	FROM   logs_data
	WHERE  rec_type = 'Auto Mode Gages'
	AND    date_1 IS NOT NULL
	AND    created >= start_date  -- '2022-08-20 23:00' -- 11:00 PM
	AND    created <= end_date -- '2022-08-21 22:59' -- 10:59 PM 
	GROUP BY  val_1, Shift
	ORDER  BY val_1, created;



END;

