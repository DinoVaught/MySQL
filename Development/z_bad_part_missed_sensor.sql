
SELECT created, msgID, 
       REPLACE(msg, '\r\n', '' ),
       REPLACE(source, '\r\n', '' )
FROM debug
WHERE  1 = 1
AND msgID LIKE('1212:%')
ORDER BY created DESC;


SELECT * FROM debug
WHERE  1 = 1
ORDER BY created DESC;



SELECT * FROM debug
WHERE 1 = 1
AND created > '2022-07-07 15:39:00'
ORDER BY created DESC;




SELECT * FROM debug
WHERE msgID = 'GetAGR_Data_By_Day'
ORDER BY created DESC;



-- =======================================================================
-- mes part missed exit chute sensor 

SELECT created AS 'Date',
       val_1   AS 'Gage',
       val_2   AS 'Lock',
       val_3   AS 'Emp ID',
       CASE WHEN val_3 = '2398' THEN 'Charmin D Ward' 
            WHEN val_3 = '2336' THEN 'Clinton J Williams'
            WHEN val_3 = '2117' THEN 'Deborah A Casmaer'
            WHEN val_3 = '2241' THEN 'Dimiya S Washington'
            WHEN val_3 = '2140' THEN 'Kysha D Noel'
            WHEN val_3 = '2173' THEN 'Nicole Colvin'
            WHEN val_3 = '2200' THEN 'Steven L Phipps'
            WHEN val_3 = '2017' THEN 'Willie M Buffkins'
            WHEN val_3 = '5040' THEN 'Kevin Bennett'
            WHEN val_3 = '' THEN ''
            ELSE "??"
       END AS 'Name'
FROM   mes.logs_data
WHERE  rec_type = 'Gages: Bad Part No Exit Chute Sensor'
       AND created > '2022-07-20 07:00:00'
ORDER  BY created DESC;


SELECT val_1        AS 'Gage',
       Count(val_2) AS 'Lock'
FROM   mes.logs_data
WHERE  rec_type = 'Gages: Bad Part No Exit Chute Sensor'
       AND val_2 = 'Locked'
       AND created > '2022-07-20 07:00:00'
GROUP  BY val_1
ORDER  BY Count(val_2) DESC;



