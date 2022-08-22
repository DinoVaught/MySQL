
SELECT * FROM mes.logs_data;


SELECT distinct(rec_type)
FROM logs_data;

-- DATE_FORMAT(sp.t_stamp, "%m/%d/%Y %r")
SELECT DATE_FORMAT(created,'%m/%d/%Y %r') as 'start', 
                                              rec_type, val_1, val_2, val_3, date_1
FROM logs_data 
WHERE rec_type = 'Auto Mode Gages'
ORDER BY val_1, created;

SELECT rec_type,
       val_1 as 'Machine',
       val_2 as 'Descr_1',
       val_3 as 'Descr_2',
       DATE_FORMAT(created, '%m/%d/%Y %r') AS 'Start Time',
       DATE_FORMAT(date_1, '%m/%d/%Y %r') AS 'End Time',
       TIMESTAMPDIFF(SECOND, created, date_1) as 'Seconds',
       TIMESTAMPDIFF(SECOND, created, date_1) / 60 as 'Minutes'
FROM   logs_data
WHERE  rec_type = 'Auto Mode Gages'
AND    date_1 IS NOT NULL
ORDER  BY val_1, created; 





SELECT distinct(rec_type)
FROM logs_data;


DELETE XX
FROM logs_data
WHERE rec_type = 'Auto Mode Gages';



SELECT val_1 as 'Machine',
       val_2 as 'Descr_1',
       val_3 as 'Descr_2',
       DATE_FORMAT(created, '%m/%d/%Y %r') AS 'Start Time',
       DATE_FORMAT(date_1, '%m/%d/%Y %r') AS 'End Time',
       TIMESTAMPDIFF(SECOND, created, date_1) as 'Seconds',
       TRUNCATE(TIMESTAMPDIFF(SECOND, created, date_1) / 60, 2) as 'Minutes'
FROM   logs_data
WHERE  rec_type = 'Auto Mode Gages'
AND    date_1 IS NOT NULL
AND    val_1 = 'G10'
ORDER  BY val_1, created;



SELECT val_1 as 'Machine',
       val_2 as 'Descr_1',
       val_3 as 'Descr_2',
       CASE WHEN HOUR(created) IN(0, 1, 2, 3, 4, 5, 6, 23) THEN '3'
            WHEN HOUR(created) IN(7, 8, 9, 10, 11, 12, 13, 14) THEN '1'
            WHEN HOUR(created) IN(15, 16, 17, 18, 19, 20, 21, 22) THEN '1'
       END AS 'Shift',
       DATE_FORMAT(created, '%m/%d/%Y %r') AS 'Start Time',
       DATE_FORMAT(date_1, '%m/%d/%Y %r') AS 'End Time',
       TIMESTAMPDIFF(SECOND, created, date_1) as 'Seconds',
       TRUNCATE(TIMESTAMPDIFF(SECOND, created, date_1) / 60, 2) as 'Minutes'
FROM   logs_data
WHERE  rec_type = 'Auto Mode Gages'
AND    date_1 IS NOT NULL
-- AND    val_1 = 'G10'
-- AND    created BETWEEN '2022-08-16' AND '2022-08-18'
-- AND created >= '2022-08-18 11:00'
-- AND created <= '2022-08-18 11:59'
ORDER BY val_1, created;




SELECT DATE_FORMAT(created, '%m/%d/%Y %r') AS 'Start Time',
	   HOUR(created) as hour,
       CASE WHEN HOUR(created) IN(0, 1, 2, 3, 4, 5, 6, 23) THEN '3'
            WHEN HOUR(created) IN(7, 8, 9, 10, 11, 12, 13, 14) THEN '1'
            WHEN HOUR(created) IN(15, 16, 17, 18, 19, 20, 21, 22) THEN '2'
       END AS 'Shift'

FROM   logs_data
WHERE  rec_type = 'Auto Mode Gages'
AND    date_1 IS NOT NULL;


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
AND    created >= '2022-08-18 23:00' -- 11:00 PM
AND    created <= '2022-08-19 14:59' -- 2:59 PM 
GROUP BY  val_1, Shift
ORDER  BY val_1, created;


