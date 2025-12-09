// reputasi sekarang
var rep = global.highest_reputation;
// hanya aktif antara 50–95
if (rep >= 50 && rep <= 95) {

    // cek apakah rep termasuk titik 3-an (53, 56, 59, dst)
    if (((rep - 50) mod 3) == 0 && semua_resep_terbuka()) {
            pager = true;
    }
}



if (instance_exists(collision_area)) {
    collision_area.x = x;
    collision_area.y = y;
}
// Cek apakah ada player yang nabrak collision-area NPC
if (place_meeting(x, y, Obj_Mc) &&  npc_path[npc_index].type = "jalan") {
    is_blocked = true;
} else {
    is_blocked = false;
}


var dekat = 32;

// Hapus icon kalau player jauh
if (instance_exists(icon_inst)) {
    if (point_distance(x, y, Obj_Mc.x, Obj_Mc.y) > dekat) {
        instance_destroy(icon_inst);
        icon_inst = noone;
    }
}

// Buat icon jika belum ada dan player dekat
if (point_distance(x, y, Obj_Mc.x, Obj_Mc.y) <= dekat) {
    if (!instance_exists(icon_inst)) {
        icon_inst = instance_create_layer(x, y - 65, "GUI", Obj_interact_icon);
    }
}

// Update posisi icon biar ngikut NPC
if (instance_exists(icon_inst)) {
    icon_inst.x = x + 2.5;
    icon_inst.y = y - 32;
}
show_debug_message(pause_condition);


if(global.day >= 6 && !is_blocked && pager){
    var target = npc_path[npc_index];
    var dist = point_distance(x, y, target.x, target.y);
	image_speed = 1;

    if (!is_paused) {
        // Horizontal dulu, vertical nanti (tidak diagonal)
        if (abs(target.x - x) > 1) {
            x += sign(target.x - x) * npc_speed;
            sprite_index = (target.x - x > 0) ? kanan : kiri;
        }
        else if (abs(target.y - y) > 1) {
            y += sign(target.y - y) * npc_speed;
            sprite_index = (target.y - y > 0) ? bawah : atas;
        }
        else {
            // Sampai titik
            if (target.type == "stop") {
                is_paused = true;
                pause_condition = false; // tunggu kondisi tertentu
            } else {
				x = target.x;
				y = target.y;
                npc_index += 1;
                if (npc_index >= array_length(npc_path)) npc_index = 0;
            }
        }
    } else {
		sprite_index = bawah;
		if(talk && point_distance(x, y, Obj_Mc.x, Obj_Mc.y) <= dekat){
			var dx = Obj_Mc.x - x;
			var dy = Obj_Mc.y - y;

			if (abs(dx) > abs(dy)) {
			    // lebih horisontal → NPC menghadap kiri/kanan
			    idle = (dx > 0) ? "kanan" : "kiri";
			} else {
			    // lebih vertikal → NPC menghadap atas/bawah
			    idle = (dy > 0) ? "bawah" : "atas";
			}

			// langsung set sprite_index sesuai idle
			switch(idle){
			    case "kanan": sprite_index = kanan; break;
			    case "kiri":  sprite_index = kiri; break;
			    case "atas":  sprite_index = atas; break;
			    case "bawah": sprite_index = bawah; break;
			}
		}
		image_index = 0;
		image_speed = 0;
        if (pause_condition) {
            is_paused = false;
            npc_index += 1;
            if (npc_index >= array_length(npc_path)) npc_index = 0;
        }
    }
}else if(is_blocked){
	image_index = 0;
	image_speed = 0;
}



