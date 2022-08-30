
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format

--========================================================================
SELECT DATE_FORMAT(created, '%m-%d-%Y  %h:%i:%S %p') 'created', msgID, msg, REPLACE(source, ', Master log_debug **', '') as 'src'
FROM debug;
-- returns ==> (08-24-2022 08:29:31: AM)
--========================================================================


--========================================================================
-- removes (1,234) comma separators
-- (tem_user) is an integer field 
 SELECT CONVERT(tem_user, CHARACTER),  -- 1,234 to 1234
        CONVERT(tem_user, CHAR),       -- 1,234 to 1234
        DATE_FORMAT(tem_time, '%m-%d-%Y  %h:%i %p') as 'tem_time',
FROM   mes.lot_table_d21
--========================================================================

DATE_FORMAT(created, '%W, %m-%Y  %h:%i:%S %p') 'created' = (Wednesday, 07-2022  02:33:17 AM)
DATE_FORMAT(created, '%a, %m-%Y  %h:%i:%S %p') 'created' = (Wed, 08-2022  08:29:31 AM)