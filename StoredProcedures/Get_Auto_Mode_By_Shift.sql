DROP PROCEDURE IF EXISTS mes.Get_Auto_Mode_By_Shift;
CREATE PROCEDURE mes.Get_Auto_Mode_By_Shift(IN qryDate varchar(20))
BEGIN
	
--  C:\Data\Dev\MySQL\StoredProcedures
--  CALL debug_msg_log('', '', '');

	  DECLARE start_date VARCHAR(50);
	  DECLARE end_date VARCHAR(50);	
	
    SET start_date = CONCAT(SUBDATE(qryDate, INTERVAL 1 DAY), ' 23:00');
    SET end_date = CONCAT(qryDate, ' 22:59');

    CALL debug_msg_log('****', start_date, end_date);


	END;

