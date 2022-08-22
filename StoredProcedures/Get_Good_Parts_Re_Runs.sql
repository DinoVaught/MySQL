DROP PROCEDURE IF EXISTS mes.Get_Good_Parts_Re_Runs;
CREATE PROCEDURE mes.`Get_Good_Parts_Re_Runs`(IN qryDate varchar(20))
BEGIN

    DECLARE start_date VARCHAR(50);
    DECLARE end_date VARCHAR(50);	
	
  
    SET start_date = CONCAT(SUBDATE(qryDate, INTERVAL 1 DAY), ' 23:00:00');
    SET end_date = CONCAT(SUBDATE(qryDate, INTERVAL -6 DAY), ' 22:59:59');
    -- SET end_date = CONCAT(qryDate, ' 22:59:00');
    
 SELECT DATE_FORMAT(sp.t_stamp, "%m/%d/%Y %r") as t_stamp,
        id.gage as Gage,
        id.part,
        sp.ndx,
        sp.skid_id,
        sp.tote_sequence AS 'tot_seq',        
        sp.tote_part_count partCount,
        sp.tote_reran
 FROM mes.skid_parts sp,  mes.skid_id id
WHERE sp.skid_id = id.skid_ndx
  AND sp.t_stamp BETWEEN start_date AND end_date
--  AND sp.t_stamp BETWEEN '2022/07/16 00:00:00' AND '2022/07/16 23:59:59'  -- Excel Date = 7/18/2022 (Week 30)
  ORDER BY sp.ndx;

END;
