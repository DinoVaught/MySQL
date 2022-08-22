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
ORDER  BY val_1, created;

 
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
AND    created >= '2022-08-20 23:00' -- 11:00 PM
AND    created <= '2022-08-21 22:59' -- 10:59 PM 
GROUP BY  val_1, Shift
ORDER  BY val_1, created;
