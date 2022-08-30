
SELECT asset
  FROM mes.skid_id
 WHERE skid_ndx = '100007793'
 LIMIT 1;

SELECT *
  FROM mes.skid_id
 WHERE skid_ndx = '100007793';



-- DATE_FORMAT(sp.t_stamp, '%d %b %Y  %h:%i %p') 

SELECT DATE_FORMAT(created, '%m-%d-%Y  %h:%i:%S %p') 'created', 
       DATE_FORMAT(created, '%a, %m-%Y  %h:%i:%S %p') 'created', 
       msgID, msg, REPLACE(source, ', Master log_debug **', '') as 'src'
FROM debug
WHERE msgID LIKE('****%') 
ORDER BY created DESC; 



SELECT DATE_FORMAT(created, '%m-%d-%Y  %h:%i:%S %p') 'created', msgID, msg, REPLACE(source, ', Master log_debug **', '') as 'src'
FROM debug ;




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




SELECT asset
  FROM mes.skid_id
 WHERE skid_ndx = 100007758
 LIMIT 1;




SELECT *
  FROM mes.skid_id
 WHERE skid_ndx = 100007758;
 
    
-- tem_user is an integer field 
 SELECT CONVERT(tem_user, CHARACTER),  -- 1,234 to 1234
        CONVERT(tem_user, CHAR),       -- 1,234 to 1234
        DATE_FORMAT(tem_time, '%m-%d-%Y  %h:%i %p') as 'tem_time'
FROM   mes.lot_table_d21
-- WHERE wip_id like '22D11235B009%'
WHERE 1 = 1
AND tem_asset is not null
ORDER  BY timee DESC
LIMIT  250;