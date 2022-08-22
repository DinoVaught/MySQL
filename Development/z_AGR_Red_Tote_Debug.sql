
SELECT created, msgID, msg, source
FROM debug
ORDER BY created DESC;

-- Total Bad Parts

-- SELECT created, msgID AS '-------        msgID', msg AS '--  msg', REPLACE(source, ', Master log_debug **', '') AS '--   src'

SELECT created, msgID, msg, REPLACE(source, ', Master log_debug **', '') AS '--   src'
FROM debug
WHERE 1 = 1
  AND msgID = 'nkjv'
ORDER BY created DESC;


SELECT created, msgID, msg, REPLACE(source, ', Master log_debug **', '') AS '--   src'
FROM debug
WHERE 1 = 1
  AND msgID LIKE('%Bad Parts%')
ORDER BY created DESC;


SELECT created, msgID, msg, source, INSTR(source, '**') 'INSTR(**'
FROM debug
WHERE 1 = 1
  AND msgID = 'nkjv'
ORDER BY msg DESC;




SELECT created, msgID, msg, source
FROM debug
ORDER BY created DESC;

-- ==========================================================
-- ==========================================================
DELETE FROM debug
WHERE msgID = 'nkjv';

DELETE FROM debug
WHERE source LIKE('%NKS1OZ%');

DELETE FROM debug
WHERE msgID LIKE('%Bad Parts%');