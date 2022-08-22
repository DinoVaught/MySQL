SELECT DATE_FORMAT(sp.t_stamp, '%d %b %Y  %h:%i %p') 'Date',
       sp.skid_id,
       id.asset,
       id.gage,
       sp.use,
       prts.lot_size 'quantity',
       id.part,       
       prts.rev,
       sp.tote_reran,
       sp.tote_sequence AS seq
 FROM mes.skid_parts sp,  mes.skid_id id, mes.part_type_table prts
WHERE sp.skid_id = id.skid_ndx
  AND id.part = prts.part_type
  AND sp.skid_id = 100007072
ORDER BY sp.t_stamp;