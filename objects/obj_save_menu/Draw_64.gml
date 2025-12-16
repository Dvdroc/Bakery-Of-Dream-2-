if(aktif){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	for (var i = 0; i < slot_count; i++) {
	    var x1 = slot_x;
	    var y1 = slot_y + i * (slot_height + slot_spacing);
	    var x2 = x1 + slot_width;
	    var y2 = y1 + slot_height;
    
	    // 1. Gambar Kotak Dasar
	    draw_set_color(c_dkgray);
	    draw_rectangle(x1, y1, x2, y2, false);
    
	    // 2. Gambar Border (Highlight kalau mouse hover)
	    var mx = device_mouse_x_to_gui(0);
	    var my = device_mouse_y_to_gui(0);
	    if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {
	        draw_set_color(c_yellow); // Hover warna kuning
	    } else {
	        draw_set_color(c_white);
	    }
	    draw_rectangle(x1, y1, x2, y2, true);
    
	    // 3. Tulis Info Slot
	    draw_set_color(c_white);
	    draw_text(x1 + slot_width/2, y1 + slot_height/2, "SLOT " + string(i+1) + "\n" + slot_info[i]);
	}

	// Reset alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}