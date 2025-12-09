if (instance_exists(collision_area)) {
    collision_area.x = x;
    collision_area.y = y;
}

if (place_meeting(x, y, Obj_Mc)) {
    is_blocked = true;
} else {
    is_blocked = false;
}

image_speed = 1;

if (global.day >= 6 && bergerak && array_length(npc_path) > 0 && !is_blocked) {

    var target = npc_path[npc_index];
    var dist = point_distance(x, y, target.x, target.y);

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
                npc_index += 1;
                if (npc_index >= array_length(npc_path)) npc_index = 0;
            }
        }
    } else {
        // NPC sedang pause, cek kondisi untuk lanjut
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

