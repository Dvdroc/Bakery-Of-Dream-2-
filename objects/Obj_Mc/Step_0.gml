if (global.player_locked) {
    speed = 0;
    exit;
}


var Kanan = keyboard_check(ord("D")) && bergerak
var Kiri = keyboard_check(ord("A")) && bergerak
var Atas = keyboard_check(ord("W")) && bergerak
var Bawah = keyboard_check(ord("S")) && bergerak

var oldy = y;
var oldx = x;

var KaKi = Kanan - Kiri;
hsp = (KaKi * moveSpd)	;
var BaTas = Bawah - Atas;
vsp = (BaTas * moveSpd);



if (bergerak){
	if (hsp > 0){
		image_xscale = 1;
		idle = -1;
		sprite_index = kanan;
	}else if (hsp < 0){
		image_xscale = 1;
		idle = 1;
		sprite_index = kiri;
	}else if (vsp < 0){
		image_xscale = 1;
		idle = 2;
		sprite_index = atas;
	}else if(vsp >0){
		image_xscale = 1;
		idle = -2;
		sprite_index = bawah;
	}else{
		if (idle == 1){
			sprite_index = kiri;
			image_index = 0;
		}else if(idle == -1){
			sprite_index = kanan;
			image_index = 0;
		}else if(idle == 2){
			sprite_index = atas;
			image_index = 0;
		}else if (idle == -2){
			sprite_index = bawah;
			image_index = 0;
		}
	}
}

y += vsp;
x += hsp; 

if (place_meeting(x + hsp, y, obj_collision)) {
    x = oldx; // kembalikan posisi horizontal
}
if (place_meeting(x, y, obj_collision)) {
    y = oldy; // kembalikan posisi vertical
}
if (place_meeting(x , y, obj_interasi_collision)) {
    x = oldx; // kembalikan posisi horizontal
	y = oldy; // kembalikan posisi vertical
}


// Toggle inventory dengan ESC


if (keyboard_check_pressed(ord("F")) && !global.dialog_open) {
    var npc = instance_place(x, y, Obj_Paman);
    var oven = instance_place(x, y, obj_oven);
	var cust = instance_place(x, y, Obj_NPC_Customer);
	var bocil = instance_place(x, y, Obj_Bocil);
	var inst = instance_place(x, y, Obj_interkasi_minigame);
	var penjual = instance_place(x, y, Obj_Eveline);
	var kasur =instance_place(x, y, Obj_bad);
	var _interact_range = 32;
	var list_unlock = [];
	for (var i = 0; i <array_length(global.recipes); i++){
		if(global.recipes[i].unlocked == true){
			
			array_push(list_unlock, global.recipes[i]);
		}
	}

    // ==== INTERAKSI NPC ====
    if (npc != noone && is_array(npc.dialog_lines)) {
        var d;
        if (!instance_exists(obj_dialogue)) {
            d = instance_create_layer(0, 0, "GUI", obj_dialogue);
        } else {
            d = instance_find(obj_dialogue, 0);
        }

        if (!d.dialogue_active && npc.dialog_index < array_length(npc.dialog_lines) && talking ) {
            global.dialog_open = true;
            bergerak = false;
            image_speed = 0;
            image_index = 0;
			if(npc.dialog_index != 2){
            d.dialogue_active = true;
            d.dialogue_text = npc.dialog_lines[npc.dialog_index];
            d.source_npc = npc.id;
            d.dialog_name = npc.char_name;
            d.portrait_sprite = npc.spr_npc_portrait;
			}
			npc.talk = true;
            npc.dialog_index++;
			
			if(npc.dialog_index == 3){
			unlocked_rundom_recipes();
			}
        } 
        else if (!d.dialogue_active && npc.dialog_index >= array_length(npc.dialog_lines)) {
            npc.dialog_index = 0;
			npc.pause_condition = true;
			talking = false;
            bergerak = true;
            image_speed = 1;
            global.dialog_open = false;
			npc.talk = false;
			

			
        }
    }
	 if (penjual!= noone && is_array(penjual.dialog_lines)) {
        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

        if (!d.dialogue_active && penjual.dialog_index < array_length(penjual.dialog_lines)) {
            global.dialog_open = true;
            bergerak = false;
            image_speed = 0;
            image_index = 0;

            d.dialogue_active = true;
            d.dialogue_text = penjual.dialog_lines[penjual.dialog_index];
			if(penjual.dialog_index == 1) d.source_npc = penjual.id;
            d.dialog_name = penjual.char_name;
            d.portrait_sprite = penjual.spr_npc_portrait;
			penjual.talk = true;
            penjual.dialog_index++;
			
			if(penjual.dialog_index == 2){
			var d2 = instance_create_layer(0, 0, "GUI", obj_dialogue);
	        d2.box_x = 420;
	        d2.box_y = 120;
	        d2.box_width = 400;
	        d2.list_data = global.harga;
			d2.list_selected = 0;
	        d2.dialogue_text = " ";
	        d2.draw_text_display = " ";
			d2.dialog_type = "oven";
	        d2.dialogue_active = true;
	        d2.dynamic_height = true;
	        d2.source_npc = penjual.id;
	        d2.dialog_name = "RESEP";
			d2.list_type = "customer";
			d2.list_selected = 0; // mulai dari resep pertama
			d2.scroll_offset = 0;
			d2.max_items_visible = 6; // biar bisa scroll
			penjual.dialog_index = 2;
			exit;
			}
			
        } 
        else if (!d.dialogue_active && penjual.dialog_index >= array_length(penjual.dialog_lines)) {
            penjual.dialog_index = 0;
			penjual.pause_condition = true;
            bergerak = true;
            image_speed = 1;
            global.dialog_open = false;
			penjual.talk = false;

			
        }
    }


   // ==== INTERAKSI OVEN ====
	   if (instance_exists(oven) && distance_to_object(oven) < _interact_range) {

	        // Tandai dialog sedang aktif agar tidak looping
	        global.dialog_open = true;
	        bergerak = false;
	        image_index = 0;
	        image_speed = 0;

	        // =======================================================
	        // 1. KOTAK INVENTORI HASIL PANGGANG (D1)
	        // =======================================================
	        var d1 = instance_create_layer(0, 0, "GUI", obj_dialogue);
	        d1.box_x = 30;
	        d1.box_y = 30;
	        d1.box_width = 300;

	        d1.list_data = global.baked_goods;
	        d1.dialogue_text = " ";
	        d1.draw_text_display = " ";
			d1.dialog_type = "oven";
	        d1.dialogue_active = true;
	        d1.dynamic_height = true;
	        d1.source_npc = oven.id;
			d1.list_type = "inventory";
	        d1.dialog_name = "INVENTORI";
			
			
			

	        // 2. KOTAK RESEP (D2)
			
	        var d2 = instance_create_layer(0, 0, "GUI", obj_dialogue);
	        d2.box_x = 420;
	        d2.box_y = 120;
	        d2.box_width = 400;

	        d2.list_data = list_unlock;
			d2.list_selected = 0;
	        d2.dialogue_text = " ";
	        d2.draw_text_display = " ";
			d2.dialog_type = "oven";
	        d2.dialogue_active = true;
	        d2.dynamic_height = true;
	        d2.source_npc = oven.id;
	        d2.dialog_name = "RESEP";
			d2.list_type = "recipe";
			d2.list_selected = 0; // mulai dari resep pertama
			d2.scroll_offset = 0;
			d2.max_items_visible = 6; // biar bisa scroll
			exit;
	    }
		
	if (cust != noone  && point_distance(x, y, cust.x, cust.y) < 32) {
		if (cust.selesai) exit;
	    // Buat pesanan jika belum ada
	    if (!cust.punya_pesanan) {
	        var unlocked = [];
	        for (var i = 0; i < array_length(global.recipes); i++) {
	            if (global.recipes[i].unlocked) array_push(unlocked, i);
	        }

	        if (array_length(unlocked) > 0) {
	            var r = irandom(array_length(unlocked)-1);
	            cust.punya_pesanan = true;
	            cust.pesanan = unlocked[r];
				

	            // Dialog pertama saat memesan
	            var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
	            d.portrait_sprite = asset_get_index("MC_GC");
	            d.dialogue_text = "Saya ingin pesanan: " + string(global.recipes[cust.pesanan].name);
	            d.draw_text_display = " ";
				d.source_npc = cust.id;
	            d.dialog_type = "npc_order";
	            d.dialogue_active = true;
				d.dialog_name = "Customer";
				image_index = 0;
				image_speed = 0;
	            cust.jeda_dialog = true; 
	            global.dialog_open = true;
				global.combo = 0;
	        }
	    }
		
		
	    // NPC menerima kue jika ada di INVENTORI
		var ada_item = array_length(global.baked_goods) > 0;
		if (cust.punya_pesanan && cust.pesanan >= 0 &&  ada_item && !cust.jeda_dialog) {
			var d1 = instance_create_layer(0, 0, "GUI", obj_dialogue);
	        d1.box_x = 520;
	        d1.box_y = 120;
	        d1.box_width = 300;

	        d1.list_data = global.baked_goods;
			d1.pesanan_customer = cust.pesanan;
	        d1.dialogue_text = " ";
	        d1.draw_text_display = " ";
			d1.dialog_type = "delivery";
	        d1.dialogue_active = true;
	        d1.dynamic_height = true;
	        d1.source_npc = cust.id;
			d1.list_type = "customer";
	        d1.dialog_name = "INVENTORI";
			d1.memilih = 0; // mulai dari resep pertama
			d1.scroll_offset = 0;
			d1.max_items_visible = 6;
			d1.selesai = cust.selesai;
			global.dialog_open = true;
			cust.jeda_dialog = true;
			image_index = 0;
			image_speed = 0;
		}


	    // Tampilkan dialog pesanan jika belum diterima
	    if (cust.punya_pesanan && cust.pesanan >= 0 && !cust.jeda_dialog && !ada_item ) {
	        var list_pesanan = ds_list_create();
	        ds_list_add(list_pesanan, global.recipes[cust.pesanan].name);
			
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
	        d.list_data = list_pesanan;
			d.portrait_sprite = asset_get_index("MC_GC");
	        d.dialogue_text = "Saya ingin pesanan: " + string(global.recipes[cust.pesanan].name);
	        d.draw_text_display = " ";
	        d.dialog_type = "npc_order";
	        d.dialogue_active = true;
	        d.source_npc = cust.id;
	        d.dialog_name = "Customer";
	        d.list_type = "npc_order";
	        d.list_selected = 0;
	        d.scroll_offset = 0;
	        d.max_items_visible = 6;
			
			image_index = 0;
			image_speed = 0;
	        ds_list_destroy(list_pesanan);

	        cust.jeda_dialog = true;
	        global.dialog_open = true;
			global.combo = 0;
	    }
	    // Reset jeda ketika dialog sudah ditutup
	    if (!global.dialog_open) {
	        cust.jeda_dialog = false;
	    }
	}
	if (inst != noone) {
		if(global.time_of_day != "malam"){
			global.activity_points -= 1;
		    room_goto(inst.target_room);
		}
	}
	if (bocil != noone && point_distance(x, y, bocil.x, bocil.y) < 32) {
	    if (!bocil.punya_pesanan) {
	        var unlocked = [];
	        for (var r = 0; r < array_length(global.recipes); r++) {
	            if (global.recipes[r].unlocked) {
	                var has_chocolate = false;
	                for (var j = 0; j < array_length(global.recipes[r].required); j++) {
	                    var bahan = global.recipes[r].required[j].bahan;
	                    if (bahan == "Cokelat batang" || bahan == "Cokelat bubuk") {
	                        has_chocolate = true;
	                        break;
	                    }
	                }
	                if (has_chocolate) array_push(unlocked, r);
	            }
	        }

	        if (array_length(unlocked) > 0) {
	            var idx = irandom(array_length(unlocked) - 1);
	            bocil.punya_pesanan = true;
	            bocil.pesanan = unlocked[idx];

	            // Cari keinginan anak kecil sesuai resep
	            for (var k = 0; k < array_length(global.keinginan); k++) {
	                if (global.keinginan[k].name == global.recipes[bocil.pesanan].name) {
	                    show_debug_message(global.keinginan[k].dialog);

	                    // Buat dialog
	                    var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
	                    d.portrait_sprite = asset_get_index("anak_coklat_wajah");
	                    d.dialogue_text = "Aku Mau makanan " + global.keinginan[k].dialog;
	                    d.draw_text_display = " ";
	                    d.source_npc = bocil.id;
	                    d.dialog_type = "npc_order";
	                    d.dialogue_active = true;
						d.dialog_name = bocil.char_name;
	                    image_index = 0;
	                    image_speed = 0;
	                    bocil.jeda_dialog = true;
	                    global.dialog_open = true;
	                    global.combo = 0;
	                    break;
	                }
	            }
	        }
	    }
		var ada_item = array_length(global.baked_goods) > 0;
		if (bocil.punya_pesanan && bocil.pesanan >= 0 &&  ada_item && !bocil.jeda_dialog) {
			var d1 = instance_create_layer(0, 0, "GUI", obj_dialogue);
	        d1.box_x = 520;
	        d1.box_y = 120;
	        d1.box_width = 300;

	        d1.list_data = global.baked_goods;
			d1.pesanan_customer = bocil.pesanan;
	        d1.dialogue_text = " ";
	        d1.draw_text_display = " ";
			d1.dialog_type = "delivery";
	        d1.dialogue_active = true;
	        d1.dynamic_height = true;
	        d1.source_npc = bocil.id;
			d1.list_type = "customer";
	        d1.dialog_name = "INVENTORI";
			d1.memilih = 0; // mulai dari resep pertama
			d1.scroll_offset = 0;
			d1.max_items_visible = 6;
			d1.selesai = bocil.selesai;
			bocil.pause_condition = true;
			global.dialog_open = true;
			bocil.jeda_dialog = true;
			image_index = 0;
			image_speed = 0;
		}


	    // Tampilkan dialog pesanan jika belum diterima
	    if (bocil.punya_pesanan && bocil.pesanan >= 0 && !bocil.jeda_dialog && !ada_item ) {
	        var list_pesanan = ds_list_create();
	        ds_list_add(list_pesanan, global.recipes[bocil.pesanan].name);
			
	         for (var k = 0; k < array_length(global.keinginan); k++) {
	                if (global.keinginan[k].name == global.recipes[bocil.pesanan].name) {
	                    show_debug_message(global.keinginan[k].dialog);

	                    // Buat dialog
	                    var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
	                    d.portrait_sprite = asset_get_index("anak_coklat_wajah");
	                    d.dialogue_text = "Sudah Kubilang Aku Mau makanan " + global.keinginan[k].dialog;
	                    d.draw_text_display = " ";
	                    d.source_npc = bocil.id;
	                    d.dialog_type = "npc_order";
	                    d.dialogue_active = true;
						d.dialog_name = bocil.char_name;
						
	                    image_index = 0;
	                    image_speed = 0;
	                    bocil.jeda_dialog = true;
	                    global.dialog_open = true;
	                    global.combo = 0;
	                    break;
	                }
	            }
			
			image_index = 0;
			image_speed = 0;
	        ds_list_destroy(list_pesanan);

	        bocil.jeda_dialog = true;
	        global.dialog_open = true;
			global.combo = 0;
	    }
	    // Reset jeda ketika dialog sudah ditutup
	    if (!global.dialog_open) {
	        bocil.jeda_dialog = false;
	    }
	}
	if (kasur != noone) {
		global.time_of_day = "pagi";
		global.day += 1;
	    room_goto(kasur.target_room);
	}
}
