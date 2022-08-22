DROP PROCEDURE IF EXISTS mes.Get_Gage_Part_Missed_Chute_Details;
CREATE PROCEDURE mes.Get_Gage_Part_Missed_Chute_Details(IN numHours int(10))

BEGIN

	-- DECLARE qry_date VARCHAR(50);

	-- SET qry_date = SUBDATE(qryDate, INTERVAL hours HOUR);

  SELECT created AS 'Date',
         val_1   AS 'Gage',
         val_2   AS 'Lock',
         val_3   AS 'Emp',
       CASE WHEN val_3 = '2398' THEN 'Charmin D Ward' 
            WHEN val_3 = '2336' THEN 'Clinton J Williams'
            WHEN val_3 = '2117' THEN 'Deborah A Casmaer'
            WHEN val_3 = '2241' THEN 'Dimiya S Washington'
            WHEN val_3 = '2140' THEN 'Kysha D Noel'
            WHEN val_3 = '2173' THEN 'Nicole Colvin'
            WHEN val_3 = '2200' THEN 'Steven L Phipps'
            WHEN val_3 = '2017' THEN 'Willie M Buffkins'
            WHEN val_3 = '5040' THEN 'Kevin Bennett'
            WHEN val_3 = '2471' THEN 'Paul Meriwether'
            WHEN val_3 = '2519' THEN 'Christine Grier'
            WHEN val_3 = '' THEN ''
            ELSE "??"
       END AS 'Name'
	FROM   mes.logs_data
	WHERE  rec_type = 'Gages: Bad Part No Exit Chute Sensor'
		   AND created > SUBDATE(SYSDATE(), INTERVAL numHours HOUR)
	ORDER  BY created DESC;


END;