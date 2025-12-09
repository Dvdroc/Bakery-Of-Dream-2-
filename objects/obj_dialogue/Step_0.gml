// A. LOGIKA KHUSUS INPUT JUMLAH (PRIORITAS TERTINGGI)
// =======================================================
if (is_crafting_input){
	
		 
	    // hitung batas maksimal craft berdasarkan inventory
	    var max_amount = 99; // default max
	    for (var i = 0; i < array_length(global.recipes[recipe_index].required); i++) {
	        var b = global.recipes[recipe_index].required[i];
	        var jumlah_inventaris = ds_map_find_value(global.inventory, b.bahan);
	        var bisa_buat = floor(jumlah_inventaris / b.jumlah); // max bisa dibuat per bahan
	        if (bisa_buat < max_amount) max_amount = bisa_buat;
	    }

	    // update craft_amount tapi tidak melebihi max_amount
	    var moved = false;

		// Naik
		if (keyboard_check_pressed(ord("W"))) {
		    craft_amount = clamp(craft_amount + 1, 1, max_amount);
		    moved = true;
		}

		// Turun
		if (keyboard_check_pressed(ord("S"))) {
		    craft_amount = clamp(craft_amount - 1, 1, max_amount);
		    moved = true;
		}
		
		if (moved) {
		    audio_play_sound(Retro_Beeep_06, 1, false);
		}

	    // tampilkan dialog
	    if (list_type == "amount") {
	        dialogue_text = "Berapa banyak " + global.recipes[recipe_index].name + "?\n[W/S] Jumlah: " + string(craft_amount) + "\n[F] Buat!   [E] Batal";
	        draw_text_display = dialogue_text;
	    }
	    if (list_type == "bahan") {
	        var teks = "";
	        for (var i = 0; i < array_length(global.recipes[recipe_index].required); i++) {
	            var b = global.recipes[recipe_index].required[i];
	            var jumlah_inventaris = ds_map_find_value(global.inventory, b.bahan); 
	            teks += b.bahan + " : " + string(jumlah_inventaris) + "/" + string(b.jumlah * craft_amount) + "   ";
	        }

	        dialogue_text = global.recipes[recipe_index].name + "\n" + teks + "\n[E] Kembali";
	        draw_text_display = dialogue_text;
	        current_char = string_length(dialogue_text);
	    }

	    // tombol F untuk craft
	    if (keyboard_check_pressed(ord("F")))
	    {
	        var _ok = 0;
	        for (var i = 0; i < craft_amount; i++)
	        {
	            if (script_craft_cake(recipe_index)) _ok++;
	            else break;
	        }
	        is_crafting_input = false;
	        with (Obj_Mc) { bergerak = true; }
	        global.dialog_open = false;
	        instance_destroy();
	        exit;
	    }
	
    // tombol E untuk batal
    if (keyboard_check_pressed(ord("E")))
    {
        is_crafting_input = false;
        with (Obj_Mc) { bergerak = true; }
        global.dialog_open = false;
        instance_destroy();
        exit;
    }

    exit;
}

if (is_buy_input){


    // =============================================================
    // 1. AMBIL DATA BAHAN YANG DIPILIH (TIDAK ADA RESEP)
    // =============================================================
    var item = global.harga[recipe_index]; 
    var nama_bahan = item.name;
    var harga_satuan = item.harga;

    // uang player
    var uang = global.gold;

    // =============================================================
    // 2. HITUNG MAX AMOUNT BERDASARKAN UANG
    // =============================================================
    var max_amount = floor(uang / harga_satuan);
    if (max_amount < 1) max_amount = 0;

    // naik turunkan jumlah
    var moved = false;

		// Naik
		if (keyboard_check_pressed(ord("W"))) {
		    craft_amount = clamp(craft_amount + 1, 1, max_amount);
		    moved = true;
		}

		// Turun
		if (keyboard_check_pressed(ord("S"))) {
		    craft_amount = clamp(craft_amount - 1, 1, max_amount);
		    moved = true;
		}
		
		if (moved) {
		    audio_play_sound(Retro_Beeep_06, 1, false);
		}
		
    var total_harga = harga_satuan * craft_amount;
	
    // =============================================================
    // 3. TAMPILKAN JUMLAH
    // =============================================================
	show_debug_message(string(craft_amount));
    if (list_type == "amount") {
		var stok_punya = ds_map_find_value(global.inventory, nama_bahan);
        dialogue_text =
            "Beli " + nama_bahan + "?\n" +
            "[W/S] Jumlah: " + string(craft_amount) + "\n" +
            "Harga total: " + string(total_harga) + "/" + string(uang) + "\n" +
			"Stok kamu: " + string(stok_punya) + "\n" +
            "[F] Beli!   [E] Batal";

        draw_text_display = dialogue_text;
    }


    // =============================================================
    // 4. TOMBOL BELI
    // =============================================================
    if (keyboard_check_pressed(ord("F"))) {

        if (uang < total_harga) {
            show_message("Uang tidak cukup!");
            exit;
        }

        // potong uang
        global.gold -= total_harga;

        // tambahkan ke inventory
        var jumlah_sekarang = ds_map_find_value(global.inventory, nama_bahan);
        ds_map_replace(global.inventory, nama_bahan, jumlah_sekarang + craft_amount);

        // tutup dialog
        is_crafting_input = false;
        with (Obj_Mc) bergerak = true;
		with (Obj_Eveline) dialog_index = 1;
        global.dialog_open = false;
        instance_destroy();
        exit;
    }

    // tombol E untuk batal
    if (keyboard_check_pressed(ord("E")))
    {
        is_buy_input = false;
        with (Obj_Mc) { bergerak = true; }
        global.dialog_open = false;
		with (Obj_Eveline) dialog_index = 1;
        instance_destroy();
        exit;
    }

    exit;
}

// =======================================================
// B. LOGIKA UMUM (Navigasi dan Penutupan)
// =======================================================
if (dialogue_active) {
    
    // Matikan gerak pemain
    if (instance_exists(Obj_Mc)) {
        with (Obj_Mc) {
            bergerak = false;
        }
    }

    // --- 0. LOGIKA NAVIGASI LIST SCROLL (WASD/Panah) ---
    if (list_type == "recipe") {
	    var _total_items = array_length(list_data);
	    var _move = 0;
	    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	        _move = 1;
	    }
	    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	        _move = -1;
	    }
		if (_move != 0) {
	        audio_play_sound(Retro_Beeep_06, 1, false);
	    }
	    list_selected = clamp(list_selected + _move, 0, _total_items - 1);
		
	    if (list_selected >= scroll_offset + max_items_visible) {
	        scroll_offset = list_selected - max_items_visible + 1;
	    }
	    if (list_selected < scroll_offset) {
	        scroll_offset = list_selected;
	    }
		if (list_selected >= 0 && list_selected < array_length(list_data)) {
			list_select =  list_data[list_selected].no;
		}
	} 
	if (list_type == "customer") {
	    var _total_items = array_length(list_data);
	    var _move = 0;
	    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	        _move = 1;
	    }
	    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	        _move = -1;
	    }
		if (_move != 0) {
	        audio_play_sound(Retro_Beeep_06, 1, false);
	    }
	    list_selected = clamp(list_selected + _move, 0, _total_items - 1);
		
	    if (list_selected >= scroll_offset + max_items_visible) {
	        scroll_offset = list_selected - max_items_visible + 1;
	    }
	    if (list_selected < scroll_offset) {
	        scroll_offset = list_selected;
	    }
	}
	
	//show_debug_message(list_selected)


    // 1. KETIKAN & SKIP
    if (current_char < string_length(dialogue_text)) {
		if (keyboard_check_pressed(ord("E")))
		{
		if (list_type == "customer") with (Obj_Eveline) dialog_index = 1;
        is_crafting_input = false;
        with (Obj_Mc) { bergerak = true; }
        global.dialog_open = false;		 
        instance_destroy();
        exit;
		}
        // Efek ketikan
        var prev_char = current_char;
		current_char += char_speed;
		draw_text_display = string_copy(dialogue_text, 1, current_char);

		// PLAY SOUND ONLY WHEN A NEW CHARACTER APPEARS
		if (current_char > prev_char) {
		    if (!audio_is_playing(SFX_RetroMultiplev5)) {
		        audio_play_sound(SFX_RetroMultiplev5, 1, false);
		    }
		}

        // Tekan F untuk langsung tampil semua teks (SKIP)
        if (keyboard_check_pressed(ord("F"))) {
            current_char = string_length(dialogue_text);
            draw_text_display = dialogue_text;
        }
    }
    
    // 2. TEKS SELESAI
    else {
        var _action_taken = false;

        // *** LOGIKA MEMBUKA KOTAK JUMLAH (RESEP) ***
        // Ini HANYA boleh berjalan pada Kotak Resep (d2) saat tombol F ditekan (Seleksi)
        if (instance_exists(source_npc) && source_npc.object_index == obj_oven){
            // Tombol F digunakan untuk memilih item yang sedang diseleksi (list_select)
            if (keyboard_check_pressed(ord("F")) && list_select != -1) {
                
                // Panggil script untuk meluncurkan Kotak Jumlah Baru
                // list_selected adalah index resep (0 atau 1)
				is_crafting_input = true;
				recipe_index = list_select;
                script_launch_amount_box(list_select);
				script_bahan(list_select);
                _action_taken = true;
			}
        }else if (instance_exists(source_npc) && (source_npc.object_index == Obj_NPC_Customer || source_npc.object_index == Obj_Bocil)  && !source_npc.selesai ){
            // Tombol F digunakan untuk memilih item yang sedang diseleksi (list_select)
            if (keyboard_check_pressed(ord("F")) && list_selected != -1 && memilih !=-1) {
                
				npc_receive_order(source_npc, list_selected, pesanan_customer);
                _action_taken = true;
			}
        }else if(instance_exists(source_npc) && source_npc.object_index == Obj_Eveline){
			 if (keyboard_check_pressed(ord("F")) && list_selected != -1){
				is_buy_input = true;
				recipe_index = list_selected;
				script_launch_amount_box(list_selected);
				_action_taken = true;
			 }
		}
        
        // 3. LOGIKA PENUTUPAN (F)
        // Jika tidak ada aksi diambil, F berfungsi sebagai penutup/exit (Hanya untuk Kotak Inventaris/Resep)
        if (!_action_taken && keyboard_check_pressed(ord("F"))) {
            
            // Aktifkan kembali gerakan pemain dan tutup
            if (instance_exists(Obj_Mc)) {
                with (Obj_Mc) {
                    bergerak = true;
                    image_speed = 1;
                }
            }
            global.dialog_open = false;
            with(obj_dialogue){
				instance_destroy()
			}
        }

        // Jika aksi diambil (Kotak Jumlah diluncurkan), hancurkan diri sendiri.
       if (keyboard_check_pressed(ord("E")))
		{
		if (list_type == "customer") with (Obj_Eveline) dialog_index = 1;
        is_crafting_input = false;
        with (Obj_Mc) { bergerak = true; }
        global.dialog_open = false;		 
        instance_destroy();
        exit;
		}

    exit;
    }
} 
else {
    // Dialog tidak aktif, hapus saja (Hanya berjalan jika dibuat dengan dialogue_active=false)
    global.dialog_open = false;
    instance_destroy();
}
// Toggle inventory dengan ESC

