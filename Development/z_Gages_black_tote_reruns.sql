		SELECT  
		   Start_Time,
		   End_Time,
		   Gage_ID,
		   CASE WHEN DATE_FORMAT(End_Time, '%H:%i:') BETWEEN '06:55:00' AND '07:05:00' THEN '3'
				WHEN DATE_FORMAT(End_Time, '%H:%i:') BETWEEN '14:55:00' AND '15:05:00' THEN '1'
				WHEN DATE_FORMAT(End_Time, '%H:%i:') BETWEEN '22:55:00' AND '23:05:00' THEN '2'      
		   END AS 'shift',      
		   (End_STN_1 - Start_STN_1) ST_1,
		   (End_STN_2 - Start_STN_2) ST_2,
		   (End_STN_3 - Start_STN_3) ST_3,
		   (End_STN_4 - Start_STN_4) ST_4,
		   (End_STN_5 - Start_STN_5) ST_5,
		   (End_STN_6 - Start_STN_6) ST_6, 
		   (Mach_Total_End - Mach_Total_Start) + (Reject_Total_End - Reject_Total_Start) Total,
		   (Reject_Total_End - Reject_Total_Start) AGR,
		   (Mach_Total_End - Mach_Total_Start) Net,
		   PartNum,
		   Start_STN_1,
		   Start_STN_2,
		   Start_STN_3,
		   Start_STN_4,
		   Start_STN_5,
		   Start_STN_6
		FROM agr_counts
		WHERE End_time IS NOT NULL
		AND RecordType = 'shift'
		AND Start_Time BETWEEN start_date AND end_date
		AND End_Time < end_date
    -- AND Start_Time BETWEEN '2022-4-20 22:59:00' AND '2022-4-21 23:01:00'
    -- AND End_Time < '2022-4-21 23:01:00'    
		ORDER BY Gage_ID, Start_Time;


------------------------------------------------------------------------------------------

SELECT * FROM debug
WHERE msgID = 'GetAGR_Data_By_Day'
ORDER BY created DESC;




    SELECT  *
		FROM agr_counts
		WHERE 1 = 1
    -- AND End_time IS NOT NULL
    -- AND RecordType IN ('re-run', 'red_tote', 're-run error')
    AND RecordType = 're-run'
    AND Gage_ID = 'G18'
    AND Start_Time BETWEEN '2022-6-29 07:00:00' AND '2022-6-29 17:01:00'
  	ORDER BY Gage_ID, Start_Time;
    
    SELECT  *
		FROM agr_counts
		WHERE 1 = 1
    AND End_time IS NULL
    AND recordtype = 'red_tote'
  	ORDER BY Start_Time;
    
-- =====================================================================================================


 SELECT DATE_FORMAT(sp.t_stamp, "%m/%d/%Y %r") as t_stamp,
        id.gage as Gage,
        sp.tote_sequence AS 'tot_seq',
        id.part,       
        sp.tote_part_count partCount,
        sp.tote_reran
 FROM mes.skid_parts sp,  mes.skid_id id
WHERE sp.skid_id = id.skid_ndx
  AND sp.t_stamp BETWEEN '2022/07/15 00:00:00' AND '2022/07/15 23:59:59'
ORDER BY id.gage, sp.t_stamp DESC;


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
  AND sp.t_stamp BETWEEN '2022/07/16 00:00:00' AND '2022/07/16 23:59:59'  -- Excel Date = 7/18/2022 (Week 30)
  AND id.gage = 'G10'
--  ORDER BY sp.ndx;
 ORDER BY Gage DESC;


 SELECT SUM(sp.tote_part_count) AS partCount,
        sp.tote_reran
 FROM mes.skid_parts sp,  mes.skid_id id
WHERE sp.skid_id = id.skid_ndx
  AND sp.t_stamp BETWEEN '2022/07/16 00:00:00' AND '2022/07/16 23:59:59'  -- Excel Date = 7/18/2022 (Week 30)
  AND sp.tote_reran = 'Y'
  AND id.gage = 'G10'
--  ORDER BY sp.ndx;
 ORDER BY Gage DESC;