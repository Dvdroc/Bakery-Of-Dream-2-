/// @description Insert description here
// You can write your code in this editor
// NPC Customer Step
if (instance_exists(collision_area)) {
    collision_area.x = x;
    collision_area.y = y;
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
global.date = false;


if (!npc_move) exit;


if (!npc_active) {
    start_delay -= 1;
    if (start_delay <= 0) npc_active = true;
    exit;  // jangan jalan path dulu
}

if (array_length(npc_path) > 0)
{
    if (npc_wait > 0) {
        npc_wait -= 1;
        exit;
    }

    var tx = npc_path[npc_index].x;
    var ty = npc_path[npc_index].y;
	var tipe = npc_path[npc_index].tipe;
    var dx = tx - x;
    var dy = ty - y;
	
	if(tipe == "jalan"){
		with(Obj_Mc){
			bergerak = false;
			image_index = 0;
			image_speed = 0;
		}
	    // --------------------------
	    // GERAK HORIZONTAL DULU
	    // --------------------------
	    if (abs(dx) > 1) {
	        x += sign(dx) * npc_speed;

	        if (sign(dx) > 0){
				sprite_index = karakter.kanan;
				idle = "kanan";
			}
	        else{ 
				sprite_index = karakter.kiri;
				idle = "kiri";
			}

	    }
	    // --------------------------
	    // SETELAH X PAS → GERAK VERTIKAL
	    // --------------------------
	    else if (abs(dy) > 1) {
	        y += sign(dy) * npc_speed;

	        if (sign(dy) > 0){ 
				sprite_index = karakter.bawah;
				idle = "bawah";
			}
	        else{
				sprite_index = karakter.atas;
				idle = "atas"
			}

	    }
	    else{
	        // sampai titik → idle
	        x = tx;
	        y = ty;

	        image_index = 0;

	        npc_wait = 20;

	        npc_index += 1;
	        if (npc_index >= array_length(npc_path))
	            npc_index = 0;
	    }
	}
	else if(tipe == "berhenti"){
		// langsung berhenti di titik ini
        x = tx;
        y = ty;
		image_index = 0;
		
		switch(idle){
			case "kanan":  sprite_index = karakter.kanan; break;
            case "kiri":   sprite_index = karakter.kiri; break;
            case "atas":   sprite_index = karakter.atas; break;
            case "bawah":  sprite_index = karakter.bawah; break;
		}
		seated = true;
		if (seated && !counted) {
	        with(obj_countdown) {
	            count += 1;   // ini counter global untuk semua NPC
	        }
	        counted = true;  // tandai instance ini sudah dihitung
	    }
	}
}



