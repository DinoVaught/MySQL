SELECT 
    Start_Time,
    End_Time,
    agr_Counts_ndx,
    Hydromat,
    Gage_ID,
    Heat,
    Operator,
    wip_ID,
    PartNum,
    (Reject_Total_End - Reject_Total_Start) AGR_Total,
    (End_STN_1 - Start_STN_1) AGR_St1,
    (End_STN_2 - Start_STN_2) AGR_St2,
    (End_STN_3 - Start_STN_3) AGR_St3,
    (End_STN_4 - Start_STN_4) AGR_St4,
    (End_STN_5 - Start_STN_5) AGR_St5,
    (End_STN_6 - Start_STN_6) AGR_St6,
    RecordType
FROM mes.agr_counts
WHERE RecordType = 'test'
AND (Reject_Total_End - Reject_Total_Start) = 0
-- AND Start_Time > '2022/06/01'
-- AND Gage_ID = 'g06'
ORDER BY Start_Time DESC;
-- LIMIT 1


-- TIMESTAMPDIFF(SECOND,from,to); 




SELECT Start_Time,
       End_Time,
       TIMESTAMPDIFF(SECOND, Start_Time, End_Time) Secnds,
       agr_Counts_ndx,
       Hydromat,
       Gage_ID,
       Heat,
       PartNum,
       (Reject_Total_End - Reject_Total_Start) AGR_Total,
       (End_STN_1 - Start_STN_1) AGR_St1,
       (End_STN_2 - Start_STN_2) AGR_St2,
       (End_STN_3 - Start_STN_3) AGR_St3,
       (End_STN_4 - Start_STN_4) AGR_St4,
       (End_STN_5 - Start_STN_5) AGR_St5,
       (End_STN_6 - Start_STN_6) AGR_St6,
       RecordType
FROM mes.agr_counts
WHERE RecordType = 'shift'
AND End_Time is not null
AND (Reject_Total_End - Reject_Total_Start) = 0
ORDER BY Start_Time;
-- ORDER BY TIMESTAMPDIFF(SECOND, Start_Time, End_Time) ASC;

SELECT DISTINCT(RecordType)  FROM agr_counts;


SELECT Start_Time,
       End_Time,
       Reject_Total_End, Reject_Total_Start,
       TIMESTAMPDIFF(SECOND, Start_Time, End_Time) Secnds,
       agr_Counts_ndx,
       Hydromat,
       Gage_ID,
       Heat,
       PartNum,
       (Reject_Total_End - Reject_Total_Start) AGR_Total,
       (End_STN_1 - Start_STN_1) AGR_St1,
       (End_STN_2 - Start_STN_2) AGR_St2,
       (End_STN_3 - Start_STN_3) AGR_St3,
       (End_STN_4 - Start_STN_4) AGR_St4,
       (End_STN_5 - Start_STN_5) AGR_St5,
       (End_STN_6 - Start_STN_6) AGR_St6,
       RecordType
FROM mes.agr_counts
WHERE RecordType = 'shift'
AND End_Time is not null
AND (Reject_Total_End - Reject_Total_Start) = 0
ORDER BY Start_Time;



SELECT agr_Counts_ndx, 
       start_time,
       end_time,
       TIMESTAMPDIFF(SECOND, Start_Time, End_Time) as scnds,
       RecordType,
       gage_id,
       partnum,
       (Reject_Total_End - Reject_Total_Start) AGR_Total,
       (End_STN_1 - Start_STN_1) AGR_St1,
       (End_STN_2 - Start_STN_2) AGR_St2,
       (End_STN_3 - Start_STN_3) AGR_St3,
       (End_STN_4 - Start_STN_4) AGR_St4,
       (End_STN_5 - Start_STN_5) AGR_St5,
       (End_STN_6 - Start_STN_6) AGR_St6
FROM mes.agr_counts
WHERE 1 = 1
AND End_Time is not null
-- AND (Reject_Total_End - Reject_Total_Start) = 0
AND TIMESTAMPDIFF(SECOND, Start_Time, End_Time) < 30
ORDER BY gage_id, Start_Time;





SELECT *
FROM mes.agr_counts
WHERE 1 = 1
AND agr_Counts_ndx = 130605;

SELECT DISTINCT (RecordType)
FROM mes.agr_counts;
-- WHERE RecordType = 'red_tote';