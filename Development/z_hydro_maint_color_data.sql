
SELECT * FROM logs_data
WHERE rec_type LIKE('Hydromat Maint%');

SELECT * FROM logs_data
WHERE rec_type LIKE('Hydromat Maint%')
AND val_1 = 'D16';


DELETE XX FROM logs_data
WHERE rec_type LIKE('Hydromat Maint%');;


SELECT * FROM debug 
ORDER BY created DESC;


SELECT * FROM debug d
WHERE d.msgID = 'scan_is_valid = False';




SELECT created, msgID, msg, LENGTH(msg), source
FROM debug
WHERE msgID = 'scan_is_valid = False'
ORDER BY created DESC;







SELECT *
FROM logs_data
WHERE rec_type LIKE('Hydromat Maint%')
AND val_1 = 'D16';


SELECT DATE_FORMAT(created, "%m/%d/%Y %r") as 'Date', val_1 as 'Machine', val_2 as 'Action', val_3 as 'Name' 
FROM logs_data
WHERE rec_type LIKE('Hydromat Maint%')
AND val_1 = 'D16';
-- AND ndx <> 3602;



