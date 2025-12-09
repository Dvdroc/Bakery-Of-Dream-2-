	/// @description Menggambar Sprite Kotak Dialog, Teks, Nama, dan Portret
	
	if (dialogue_active){
		
	    // === PERHITUNGAN TINGGI DINAMIS ===
	    if (dynamic_height) {
	        // Jika ini adalah List Scroll (list_data ada), kita harus mengukur tinggi berdasarkan max_items_visible
	        if (array_length(list_data) > 0) {
	            // Tinggi dihitung berdasarkan jumlah item yang terlihat
	            box_height = max_items_visible * item_height + vertical_padding; 
	        } else {
	            // Jika ini mode Typewriter/Input Jumlah, hitung tinggi teks normal
	            var _text_height = string_height_ext(draw_text_display, -1, box_width - 32);
	            box_height = _text_height + vertical_padding;
	        }
	    }
	
	    // --- KODE LAMA ANDA: Gambar Latar Belakang (1) & Portret/Nama (2, 3) ---
	    var _xscale = box_width / sprite_get_width(spr_dialogue_box);
	    var _yscale = box_height / sprite_get_height(spr_dialogue_box);
    
	    // 1. Gambar Kotak Dialog Latar Belakang
	    if (sprite_exists(spr_dialogue_box)) {
			draw_sprite_ext(spr_dialogue_box, image_index, box_x, box_y, _xscale, _yscale, 0, c_grey, 1);
		} else {
	        // FALLBACK: Gambar kotak hitam sederhana
	        draw_set_alpha(0.8); 
	        draw_set_color(c_black);
	        draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
	        draw_set_alpha(1);
		}

	    // 2. Gambar Portret (Portret/Nama harus selalu digambar, meskipun di mode list)
	    if (portrait_sprite != noone && sprite_exists(portrait_sprite)) {
	        var _padding = 20; 
	        var _portrait_x = box_x + _padding; 
	        var _portrait_y = box_y  + 15+ _padding; 
	        draw_sprite_ext(portrait_sprite, 0, _portrait_x, _portrait_y, 1, 1, 0, c_white, 1);
	    }
    
	    // 3. Gambar Nama Karakter
	    if (dialog_name != "") {
	        draw_set_font(-1); 
	        draw_set_color(c_yellow);
	        draw_set_halign(fa_left); 
	        var _name_x = box_x + 10; 
	        var _name_y = box_y + 10; 
	        draw_text(_name_x, _name_y, dialog_name);
	        draw_set_halign(fa_left); // Reset perataan
	    }


	    // =======================================================
	    // 4.	LOGIKA GAMBAR LIST SCROLL (Menggantikan Teks Biasa) 
	    // =======================================================
	    if (array_length(list_data) > 0) 
	    {
	        draw_set_font(-1);
	        var _start_y = box_y + vertical_padding / 2;
	        var _text_padding_x = box_x + 10;
	        var _item_height = 20; // Menggunakan item_height yang sudah didefinisikan

	        for (var i = 0; i < array_length(list_data); i++) 
	        {
	            // 1. Konstruksi Teks Item (Gunakan logika yang benar untuk Inventaris/Resep)
	            var _item_data = list_data[i];
	            var _item_display_text;
            
	            // Asumsi: Jika item memiliki 'count', itu Inventaris. Jika tidak, itu Resep.
	            if (list_type == "inventory") {
				    _item_display_text = "(" + string(_item_data.count) + "x) " + _item_data.name;
				} else {
				    _item_display_text = "[" + string(i + 1) + "] " + _item_data.name;
				}


	            // 2. Hitung Posisi Y dengan Offset Scroll
	            var _draw_y = _start_y + (i - scroll_offset) * _item_height;

	            // 3. Cek Clipping (apakah item berada di dalam batas vertikal kotak)
	            if (_draw_y >= box_y + 36 && _draw_y < box_y + box_height - 10) // 36px di bawah nama, 10px dari bawah
	            {
	                // Highlight item yang dipilih
	                if (i == list_selected) {
	                    draw_set_color(c_yellow);
	                    draw_rectangle(_text_padding_x - 5, _draw_y - 10, _text_padding_x + box_width - 15, _draw_y + _item_height -10, false);
	                    draw_set_color(c_black); // Teks hitam di atas highlight kuning
	                } else {
	                    draw_set_color(c_white);
	                }

	                // Gambar Teks Item
	                draw_text(_text_padding_x, _draw_y - 10, _item_display_text);
	            }
	        }
	        draw_set_color(c_white); // Reset warna
	    }
    
	    // --- 5. Gambar Teks Dialog Asli (HANYA untuk Kotak Input Jumlah/Typewriter) ---
	    else 
	    {
	        // ... (Kode perhitungan posisi teks Anda yang lama) ...
	        draw_set_font(-1);
	        draw_set_color(c_white);
        
	        var _DEFAULT_PORTRAIT_WIDTH = 64; 
	        var _sprite_width_actual = (portrait_sprite != noone && sprite_exists(portrait_sprite)) ? sprite_get_width(portrait_sprite) : _DEFAULT_PORTRAIT_WIDTH;

	        var _text_start_x = box_x + _sprite_width_actual + 24; 
	        var _total_padding_area = _sprite_width_actual + 32; 
	        var _text_area_width = box_width - _total_padding_area; 
	        var _text_start_y = box_y + 36; 

	        draw_text_ext(_text_start_x, _text_start_y, draw_text_display, -1, _text_area_width);
			
	    }
	}
	
	

