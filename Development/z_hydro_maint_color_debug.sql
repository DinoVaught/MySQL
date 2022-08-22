SELECT * FROM debug
WHERE 1 = 1
  AND msgID like '****%'
  -- AND created > '2022-07-01 8:42'
ORDER BY created DESC;

SELECT * FROM debug
WHERE 1 = 1
  AND created > '2022-07-01 8:42'
  AND msgID not like 'zsw%'
ORDER BY created DESC;


DELETE FROM debug
WHERE 1 = 1
  AND msgID like 'UDT Tag error%';

DELETE FROM debug
WHERE 1 = 1
  AND msgID like '****%';


DELETE FROM debug
WHERE 1 = 1
  AND msgID = 'scan_is_valid = False';







SELECT * FROM debug
WHERE 1 = 1
 AND msgID LIKE 'hydro%'
 AND created < '2022-06-30 16:02'
ORDER BY created DESC;


DELETE  FROM debug
WHERE 1 = 1
 AND msgID LIKE 'hydro%';
 -- AND created < '2022-06-30 16:02'






SELECT *, LENGTH(msg) FROM debug
WHERE msgID LIKE 'hydro%'
-- AND LENGTH(msg) < 3
ORDER BY created DESC;



SELECT * FROM debug
WHERE msgID = 'UDT Tag error'
AND source LIKE('%H7NFUR%')
ORDER BY created DESC;


DELETE z FROM debug
WHERE msgID = 'UDT Tag error'
AND source LIKE('%H7NFUR%');