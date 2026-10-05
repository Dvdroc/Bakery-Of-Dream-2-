if (is_array(lines) && !global.dialog_open && dialog_index == 0 ) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

	        if (!d.dialogue_active && dialog_index < array_length(lines)) {
	            global.dialog_open = true;
	            image_speed = 0;
	            image_index = 0;

	            d.dialogue_active = true;
	            d.dialogue_text = lines[dialog_index];
	            d.dialog_name = "";
				dialog_index++;
	        } 
	        else if (!d.dialogue_active && dialog_index >= array_length(lines)) {
	            dialog_index = 0;
	            global.dialog_open = false;

			
	        }
	    }
		if (keyboard_check_pressed(ord("F")) && !global.dialog_open){
		if (is_array(lines)) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

	        if (!d.dialogue_active && dialog_index < array_length(lines)) {
	            global.dialog_open = true;
	            image_speed = 0;
	            image_index = 0;

	            d.dialogue_active = true;
	            d.dialogue_text = lines[dialog_index];
	            d.dialog_name = ""
				dialog_index++;
	        } 
	        else if (!d.dialogue_active && dialog_index >= array_length(lines)) {
	            dialog_index = 0;
				room_goto(toko_dalam);
	            global.dialog_open = false;

			
	        }
	    }
		}