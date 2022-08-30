DROP PROCEDURE IF EXISTS mes.Get_Auto_Mode_Shift_Biz;
CREATE PROCEDURE mes.Get_Auto_Mode_Shift_Biz(IN ovrDate DATETIME)
BEGIN
	
--  C:\Data\Dev\MySQL\StoredProcedures
	DECLARE inHour INT DEFAULT HOUR(ovrDate);
	DECLARE shiftStart VARCHAR(50);
	
	DECLARE shft3Start VARCHAR(10) DEFAULT ' 23:00:00';
	DECLARE shft1Start VARCHAR(10) DEFAULT ' 7:00:00';
	DECLARE shft2Start VARCHAR(10) DEFAULT ' 15:00:00';	

 	IF inHour IN (0, 1, 2, 3, 4, 5, 6, 23) THEN  -- 3rd shift
 		SET shiftStart = CONCAT(YEAR(ovrDate), '-', MONTH(ovrDate), '-', DAY(ovrDate), shft3Start);
 	END IF;
		
	IF inHour IN (7, 8, 9, 10, 11, 12, 13, 14) THEN  -- 1st shift
 		SET shiftStart = CONCAT(YEAR(ovrDate), '-', MONTH(ovrDate), '-', DAY(ovrDate), shft1Start);
	END IF;
		
	IF inHour IN (15, 16, 17, 18, 19, 20, 21, 22) THEN  -- 2nd shift
 		SET shiftStart = CONCAT(YEAR(ovrDate), '-', MONTH(ovrDate), '-', DAY(ovrDate), shft2Start);		
	END IF;

	CALL debug_msg_log('****', ovrDate, shiftStart);

END;
