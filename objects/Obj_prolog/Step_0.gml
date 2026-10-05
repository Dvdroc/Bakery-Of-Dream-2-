with(obj_game_manager) visible = false;
if(global.day == 1){
	if (is_array(dialog_lines) && !global.dialog_open && dialog_index == 0 ) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

	        if (!d.dialogue_active && dialog_index < array_length(dialog_lines)) {
	            global.dialog_open = true;
	            image_speed = 0;
	            image_index = 0;

	            d.dialogue_active = true;
	            d.dialogue_text = dialog_lines[dialog_index];
	            d.dialog_name = ""
				dialog_index++;
	        } 
	        else if (!d.dialogue_active && dialog_index >= array_length(dialog_lines)) {
	            dialog_index = 0;
	            global.dialog_open = false;

			
	        }
	    }
	if (keyboard_check_pressed(ord("F")) && !global.dialog_open){
		if (is_array(dialog_lines)) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

	        if (!d.dialogue_active && dialog_index < array_length(dialog_lines)) {
	            global.dialog_open = true;
	            image_speed = 0;
	            image_index = 0;

	            d.dialogue_active = true;
	            d.dialogue_text = dialog_lines[dialog_index];
	            d.dialog_name = ""
				dialog_index++;
	        } 
	        else if (!d.dialogue_active && dialog_index >= array_length(dialog_lines)) {
	            dialog_index = 0;
				room_goto(toko_dalam);
	            global.dialog_open = false;

			
	        }
	    }
	}
}
if(global.day == 40 && (global.gold < 30000 || global.reputation < 100)){
	if (is_array(bad_dialog_lines) && !global.dialog_open && dialog_index == 0 ) {
        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

        if (!d.dialogue_active && dialog_index < array_length(bad_dialog_lines)) {
            global.dialog_open = true;
            image_speed = 0;
            image_index = 0;

            d.dialogue_active = true;
            d.dialogue_text = bad_dialog_lines[dialog_index];
            d.dialog_name = ""
			dialog_index++;
        } 
        else if (!d.dialogue_active && dialog_index >= array_length(bad_dialog_lines)) {
            dialog_index = 0;
            global.dialog_open = false;

			
        }
    }
if (keyboard_check_pressed(ord("F")) && !global.dialog_open){
		if (is_array(bad_dialog_lines)) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

	        if (!d.dialogue_active && dialog_index < array_length(bad_dialog_lines)) {
	            global.dialog_open = true;
	            image_speed = 0;
	            image_index = 0;

	            d.dialogue_active = true;
	            d.dialogue_text = bad_dialog_lines[dialog_index];
	            d.dialog_name = ""
				dialog_index++;
	        } 
	        else if (!d.dialogue_active && dialog_index >= array_length(bad_dialog_lines)) {
	            dialog_index = 0;
				room_goto(Start);
	            global.dialog_open = false;

			
	        }
	    }
	}
}else if(global.day == 40 && global.gold >= 30000 && global.reputation >= 100){
	if (is_array(good_dialog_lines) && !global.dialog_open && dialog_index == 0 ) {
        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

        if (!d.dialogue_active && dialog_index < array_length(good_dialog_lines)) {
            global.dialog_open = true;
            image_speed = 0;
            image_index = 0;

            d.dialogue_active = true;
            d.dialogue_text = good_dialog_lines[dialog_index];
            d.dialog_name = ""
			dialog_index++;
        } 
        else if (!d.dialogue_active && dialog_index >= array_length(good_dialog_lines)) {
            dialog_index = 0;
            global.dialog_open = false;

			
        }
    }
	if (keyboard_check_pressed(ord("F")) && !global.dialog_open){
		if (is_array(good_dialog_lines)) {
			var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
			if (!d.dialogue_active && dialog_index < array_length(good_dialog_lines)) {
		            global.dialog_open = true;
		            image_speed = 0;
		            image_index = 0;

		            d.dialogue_active = true;
		            d.dialogue_text = good_dialog_lines[dialog_index];
		            d.dialog_name = ""
					dialog_index++;
		        } 
		        else if (!d.dialogue_active && dialog_index >= array_length(good_dialog_lines)) {
		            dialog_index = 0;
					room_goto(Start);
		            global.dialog_open = false;

			
		        }
		    }
	}
}