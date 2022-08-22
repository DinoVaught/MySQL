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
    AND RecordType = 're-run'
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
    

 
 