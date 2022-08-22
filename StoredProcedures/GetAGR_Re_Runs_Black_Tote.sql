DROP PROCEDURE IF EXISTS mes.GetAGR_Re_Runs_Black_Tote;
CREATE PROCEDURE mes.GetAGR_Re_Runs_Black_Tote(IN qryDate varchar(20))
BEGIN

	DECLARE start_date VARCHAR(50);
	DECLARE end_date VARCHAR(50);

	SET start_date = CONCAT(SUBDATE(qryDate, INTERVAL 1 DAY), ' 23:00:00');
	SET end_date = CONCAT(SUBDATE(qryDate, INTERVAL -6 DAY), ' 22:59:59');

	-- CALL debug_msg_log('GetAGR_Re_Runs_Black_Tote', start_date, end_date);


	SELECT id.gage AS "Gage_ID",
		     id.part AS "partNum",
		     SUM(sp.tote_part_count) partCount
	  FROM mes.skid_parts sp,
		   mes.skid_id id
	 WHERE sp.skid_id = id.skid_ndx
		   AND sp.tote_reran_date BETWEEN start_date AND end_date
		   -- AND sp.tote_reran_date BETWEEN '2022/07/16 00:00:00' AND '2022/07/16 23:59:59'
		   AND sp.tote_reran = 'Y'
	 GROUP BY id.gage, id.part
	 ORDER BY id.gage, id.part;

END;
