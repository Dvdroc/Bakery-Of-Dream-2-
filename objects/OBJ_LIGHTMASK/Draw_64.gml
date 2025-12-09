/// @description Insert description here
// You can write your code in this editor
// Buat surface
if(global.time_of_day == "malam"){
	if (!surface_exists(light_surf)) {
	    light_surf = surface_create(room_width, room_height);
	}

	// Gambar ke surface
	surface_set_target(light_surf);
	draw_clear_alpha(c_black, 0.75); // gelap seluruh layar

	// Mode untuk menghapus kegelapan
	gpu_set_blendmode(bm_subtract);

	// 1. CAHAYA PLAYER
    pulse_time += 0.05; // kecepatan denyut, makin besar makin cepat

	var pulse = sin(pulse_time) * 4; 
	// *4 = perubahan radius hanya +-4 (pelan & lembut)

	if (instance_exists(Obj_Mc)) {
	    var base_r = 64;
	    var final_r = base_r + pulse;
	    draw_circle(Obj_Mc.x + 15, Obj_Mc.y + 15, final_r, false);
	}

	with (Obj_Lampu) {
	    var base_r = 120;
	    var final_r = base_r + pulse;
	    draw_circle(x  + 15, y  + 15, final_r, false);
	}

 
	// Kembalikan normal
	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	// Gambar ke layar
	draw_surface(light_surf, 0, 0);
}