// Gambar Latar Kotak Hitam
if(aktif){
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_rectangle(menu_x - width/2, menu_y - height/2, menu_x + width/2, menu_y + height/2, false);
	draw_set_alpha(1);

	// Gambar Border Putih
	draw_set_color(c_white);
	draw_rectangle(menu_x - width/2, menu_y - height/2, menu_x + width/2, menu_y + height/2, true);

	// Judul
	draw_set_halign(fa_center);
	draw_text(menu_x, menu_y - height/2 + 20, "SETTINGS");

	// Gambar Opsi & Slider
	var start_y = menu_y - 50;
	var gap = 40;
	var bar_w = 150; // Lebar bar volume

	for (var i = 0; i < array_length(options); i++) {
	    var _y = start_y + (i * gap);
	    var _col = c_gray;
	    var _txt = options[i];
    
	    if (i == selected) {
	        _col = c_yellow;
	        _txt = "> " + _txt + " <";
	    }
    
	    draw_set_color(_col);
	    draw_text(menu_x, _y, _txt);
    
	    // Gambar Bar Volume (Hanya untuk 3 opsi pertama)
	    if (i < 3) {
	        var val = 0;
	        if (i == 0) val = global.vol_master;
	        if (i == 1) val = global.vol_music;
	        if (i == 2) val = global.vol_sfx;
        
	        // Bar Background (Kosong)
	        draw_set_color(c_dkgray);
	        draw_rectangle(menu_x - bar_w/2, _y + 15, menu_x + bar_w/2, _y + 20, false);
        
	        // Bar Isi (Penuh sesuai volume)
	        var isi = val * bar_w;
	        draw_set_color(i == selected ? c_lime : c_white);
	        draw_rectangle(menu_x - bar_w/2, _y + 15, (menu_x - bar_w/2) + isi, _y + 20, false);
        
	        // Teks Angka Persen
	        draw_set_color(c_white);
	        draw_text(menu_x + bar_w/2 + 30, _y + 10, string(round(val * 100)) + "%");
	    }
	}

	// Reset alignment
	draw_set_halign(fa_left);
}