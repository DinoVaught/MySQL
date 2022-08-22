
-- ==================================================================================
-- User this query (below) to retrieve the record / Totes that have been reran
-- ==================================================================================

 SELECT DATE_FORMAT(sp.t_stamp, "%m/%d/%Y %r") as "Date2",
        id.gage,
        sp.tote_sequence AS 'tot_seq',
        id.part,       
        sp.tote_part_count partCount,
        tote_reran
 FROM mes.skid_parts sp,  mes.skid_id id
WHERE sp.skid_id = id.skid_ndx
  AND sp.t_stamp BETWEEN '2022/07/16 00:00:00' AND '2022/07/16 23:59:59'
  AND tote_reran = 'Y'
ORDER BY sp.t_stamp DESC;


 SELECT id.gage,
        id.part,
        SUM(sp.tote_part_count) partCount
 FROM mes.skid_parts sp,  mes.skid_id id
WHERE sp.skid_id = id.skid_ndx
  AND sp.t_stamp BETWEEN '2022/07/16 00:00:00' AND '2022/07/16 23:59:59'
  AND sp.tote_reran = 'Y'
  GROUP BY id.gage, id.part
  ORDER BY id.gage, id.part;


-- ==================================================================================

 SELECT  * FROM mes.skid_parts
 WHERE 1 = 1
 AND t_stamp > '2022-07-18 00:00:00'
 ORDER BY t_stamp; 


	SELECT sp.ndx,
         sp.t_stamp,
         id.gage,
		     id.part,
         sp.tote_sequence,
		     sp.tote_part_count as partCount,
         sp.tote_reran
	  FROM mes.skid_parts sp,
		   mes.skid_id id
	 WHERE sp.skid_id = id.skid_ndx
		 AND sp.t_stamp >= '2022-07-18 00:00:00'
     AND sp.tote_reran = 'Y'
	 ORDER BY id.gage, sp.tote_sequence DESC;
   
SELECT * 
FROM mes.skid_parts
WHERE tote_reran = 'Y';


SELECT * 
FROM mes.skid_parts
WHERE skid_id = 100007173
ORDER BY t_stamp DESC;

SELECT * 
FROM mes.skid_parts
where ndx = 72
ORDER BY t_stamp ASC;


SELECT MIN(t_stamp)
FROM mes.skid_parts;


SELECT * 
FROM mes.skid_parts
where t_stamp = (SELECT MIN(t_stamp)
                   FROM mes.skid_parts)
AND ndx = (SELECT MIN(ndx) FROM mes.skid_parts)
ORDER BY t_stamp ASC;


SELECT * 
FROM mes.skid_parts
WHERE skid_id = 100007195
ORDER BY t_stamp DESC;



SELECT ndx, wip_id, skid_id, skid_id * -1,  t_stamp, `use`, tote_part_count, is_short, tote_sequence, tote_reran
FROM skid_parts
WHERE ndx = 189821;


UPDATE skid_parts
set skid_id = skid_id * -1
WHERE ndx = 189821;