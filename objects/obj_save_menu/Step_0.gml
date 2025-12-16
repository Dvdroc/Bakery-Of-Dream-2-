if (keyboard_check(vk_escape)){
	aktif = true;
	
}
if (mouse_check_button_pressed(mb_left) && aktif) {
    var mx = device_mouse_x_to_gui(0); // Pakai GUI coordinate biar akurat
    var my = device_mouse_y_to_gui(0);

    for (var i = 0; i < slot_count; i++) {
        var x1 = slot_x;
        var y1 = slot_y + i * (slot_height + slot_spacing);
        var x2 = x1 + slot_width;
        var y2 = y1 + slot_height;

        // Cek jika mouse di atas slot
        if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {
            
            var _filename = "savefile_" + string(i) + ".json";
            
            if (mode == "save") {
                // LAKUKAN SAVE
                scr_save_game(_filename);
                
                // Update info di layar langsung
                slot_info[i] = "Day " + string(global.day) + " (" + global.musim + ")";
				aktif = false;
            } 
            else if (mode == "load") {
                // LAKUKAN LOAD
                if (file_exists(_filename)) {
                    scr_load_game(_filename);
                    room_goto(GUI); // Pindah ke room game
					aktif = false;
                }
            }
        }
    }
}