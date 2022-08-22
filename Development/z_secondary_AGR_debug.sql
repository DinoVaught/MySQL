    SELECT  
		   Start_Time,
		   End_Time,
		   Gage_ID,
       SUM(End_STN_1 - Start_STN_1) ST_1,
		   SUM(End_STN_2 - Start_STN_2) ST_2,
		   SUM(End_STN_3 - Start_STN_3) ST_3,
		   SUM(End_STN_4 - Start_STN_4) ST_4,
		   SUM(End_STN_5 - Start_STN_5) ST_5,
		   SUM(End_STN_6 - Start_STN_6) ST_6, 
		   SUM(Mach_Total_End - Mach_Total_Start) + (Reject_Total_End - Reject_Total_Start) Total,
		   SUM(Reject_Total_End - Reject_Total_Start) AGR,
		   SUM(Mach_Total_End - Mach_Total_Start) Net,
		   PartNum
		FROM agr_counts
		WHERE End_time IS NOT NULL
		AND RecordType = 'shift'
-- 		AND Start_Time BETWEEN start_date AND end_date
-- 		AND End_Time < end_date
     AND Start_Time BETWEEN '2022-6-21 22:59:00' AND '2022-6-22 23:01:00'
     AND End_Time < '2022-6-22 23:01:00'    
     Group by Gage_ID
		ORDER BY Gage_ID, Start_Time;

------------------------------------------------------------------------------------------

    
    SELECT  
		   Start_Time,
		   End_Time,
		   Gage_ID,
       (End_STN_1 - Start_STN_1) ST_1,
		   (End_STN_2 - Start_STN_2) ST_2,
		   (End_STN_3 - Start_STN_3) ST_3,
		   (End_STN_4 - Start_STN_4) ST_4,
		   (End_STN_5 - Start_STN_5) ST_5,
		   (End_STN_6 - Start_STN_6) ST_6, 
		   (Mach_Total_End - Mach_Total_Start) + (Reject_Total_End - Reject_Total_Start) Total,
		   (Reject_Total_End - Reject_Total_Start) AGR,
		   (Mach_Total_End - Mach_Total_Start) Net,
		   PartNum
		FROM agr_counts
		WHERE End_time IS NOT NULL
		AND RecordType = 'shift'
-- 		AND Start_Time BETWEEN start_date AND end_date
-- 		AND End_Time < end_date
     AND Start_Time BETWEEN '2022-07-31 22:59:00' AND '2022-8-1 23:01:00'
     AND End_Time < '2022-8-1 23:01:00'
     AND Gage_ID = 'G13'
		ORDER BY Gage_ID, Start_Time;
    
------------------------------------------------------------------------------------------

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
		   PartNum
		FROM agr_counts
		WHERE End_time IS NOT NULL
		AND RecordType = 'shift'
-- 		AND Start_Time BETWEEN start_date AND end_date
-- 		AND End_Time < end_date
     AND Start_Time > '2022-6-20 15:01:00'
     AND Start_Time < '2022-6-22 15:01:00'
     AND Gage_ID IN ('G16')
		ORDER BY Gage_ID, Start_Time;
    
-------------------------------------------------------------------------------------------------------------

		SELECT  
		   Start_Time,
		   End_Time,
		   Gage_ID,
		   CASE WHEN DATE_FORMAT(End_Time, '%H:%i:') BETWEEN '06:55:00' AND '07:05:00' THEN '3'
				WHEN DATE_FORMAT(End_Time, '%H:%i:') BETWEEN '14:55:00' AND '15:05:00' THEN '1'
				WHEN DATE_FORMAT(End_Time, '%H:%i:') BETWEEN '22:55:00' AND '23:05:00' THEN '2'      
		   END AS 'shift',         
       sum(End_STN_1 - Start_STN_1) ST_1,
		   sum(End_STN_2 - Start_STN_2) ST_2,
		   sum(End_STN_3 - Start_STN_3) ST_3,
		   sum(End_STN_4 - Start_STN_4) ST_4,
		   sum(End_STN_5 - Start_STN_5) ST_5,
		   sum(End_STN_6 - Start_STN_6) ST_6, 
		   sum(Mach_Total_End - Mach_Total_Start) + (Reject_Total_End - Reject_Total_Start) Total,
		   sum(Reject_Total_End - Reject_Total_Start) AGR,
		   sum(Mach_Total_End - Mach_Total_Start) Net,
		   PartNum
		FROM agr_counts
		WHERE End_time IS NOT NULL
		AND RecordType = 'shift'
-- 		AND Start_Time BETWEEN start_date AND end_date
-- 		AND End_Time < end_date
     AND Start_Time > '2022-6-18 15:01:00'
     AND Start_Time < '2022-6-22 15:01:00'
     -- AND Gage_ID IN ('G16')
     group by Gage_ID, PartNum
		ORDER BY Gage_ID, Start_Time;
    
-----------------------------------------------------------------------------------------------------------------


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
    AND Start_Time BETWEEN '2022-06-28 22:59:00' AND '2022-6-29 23:01:00'
    AND End_Time < '2022-6-29 23:01:00'    
    AND  Gage_ID = 'G18'
		ORDER BY Gage_ID, Start_Time;
    
		SELECT  
		   *
		FROM agr_counts
		WHERE End_time IS NOT NULL
		AND RecordType = 'shift'
    AND Start_Time BETWEEN '2022-06-28 22:59:00' AND '2022-6-29 23:01:00'
    AND End_Time < '2022-6-29 23:01:00'    
    AND  Gage_ID IN ('G18', 'G17')
		ORDER BY Gage_ID, Start_Time;
    

    
    SELECT Start_STN_1, Start_STN_2, Start_STN_3, Start_STN_4, Start_STN_5, Start_STN_6, End_STN_1, End_STN_2, End_STN_3, End_STN_4, End_STN_5, End_STN_6 
    FROM agr_counts
    WHERE 1 = 1 
		-- AND RecordType = 'shift'
    AND Start_Time > '2022-06-28 22:59:00'
    AND  Gage_ID = 'G07'
		ORDER BY Gage_ID, Start_Time;    
    
    
-- Paul's ----------------------------------- 
    SELECT  

         End_STN_1,
  End_STN_2,
  End_STN_3,
  End_STN_4,
  End_STN_5,
  End_STN_6,    

  Start_STN_1,
  Start_STN_2,
  Start_STN_3,
  Start_STN_4,
  Start_STN_5,
  Start_STN_6,  
    
		   Start_Time,
		   End_Time,
		   Gage_ID,
       (End_STN_1 - Start_STN_1) ST_1,
		   (End_STN_2 - Start_STN_2) ST_2,
		   (End_STN_3 - Start_STN_3) ST_3,
		   (End_STN_4 - Start_STN_4) ST_4,
		   (End_STN_5 - Start_STN_5) ST_5,
		   (End_STN_6 - Start_STN_6) ST_6, 

       
		   (Mach_Total_End - Mach_Total_Start) + (Reject_Total_End - Reject_Total_Start) Total,
		   (Reject_Total_End - Reject_Total_Start) AGR,
		   (Mach_Total_End - Mach_Total_Start) Net,
		   PartNum
		FROM agr_counts
		WHERE End_time IS NOT NULL
		AND RecordType = 'shift'
-- 		AND Start_Time BETWEEN start_date AND end_date
-- 		AND End_Time < end_date
     AND Start_Time BETWEEN '2022-07-31 22:59:00' AND '2022-8-1 23:01:00'
     AND End_Time < '2022-8-1 23:01:00'
     AND Gage_ID = 'G13'
		ORDER BY Gage_ID, Start_Time;