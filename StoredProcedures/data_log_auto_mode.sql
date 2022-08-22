DROP PROCEDURE IF EXISTS mes.data_log_auto_mode;
CREATE PROCEDURE mes.data_log_auto_mode(IN data_id varchar(200),
							            IN machine_id varchar(200),
							            IN auto_on_off varchar(200),
							            IN tag_true_false varchar(200))

BEGIN

	-- call debug_msg_log('', '', '');

	IF UCASE(tag_true_false) = 'TRUE' THEN -- start new record 
	
		
		INSERT INTO mes.logs_data
							(created,
							 rec_type,
							 val_1,
							 val_2,
							 val_3)
							 VALUES(SYSDATE(), -- :created
							 data_id,          -- :rec_type
							 machine_id,       -- :val_1, 
							 auto_on_off,      -- :val_2,
							 tag_true_false);  -- :val_3

			 
	ELSE
		
		UPDATE mes.logs_data
		SET date_1 = SYSDATE() -- ** flag existing record as complete
		WHERE rec_type = data_id
		AND val_1 = machine_id
		AND date_1 IS NULL;	
		
	END IF;

END;
