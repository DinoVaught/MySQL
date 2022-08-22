

SELECT created, msgID, msg, REPLACE(source, ', Master log_debug **', '') as 'src'
FROM debug
WHERE msgID LIKE('****%') 
ORDER BY created DESC; 


SELECT * FROM debug
ORDER BY created DESC;


DELETE FROM debug
WHERE msgID LIKE('****%');


DELETE FROM debug
WHERE source LIKE('%MV9UZ1%');





SELECT DATE_FORMAT(created, "%m/%d/%Y %r") as 'Date', val_1 as 'Gage', val_2 FROM logs_data
WHERE rec_type = 'Auto Mode Gages'
AND val_1 = 'G06'
ORDER BY created;

