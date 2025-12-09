// Cek player menempel ke portal (collision mask sprite)
var inst = instance_place(x, y, Obj_Mc); // Obj_Mc = object player

if (inst != noone && room_target != noone) {
	with(Obj_Mc){
		bergerak = false;
		image_index = 0;
		image_speed = 0;
	}
	
	with (Obj_transisi) fade_direction = 1;

	
	
    // sebelum pindah room, simpan spawn player menggunakan global
    // ini tetap aman karena instance hilang saat room_goto
    global.spawn_x = spawn_x;
    global.spawn_y = spawn_y;
	if (countdown_timer_done > 0) {
		    countdown_timer_done -= 1;
		} else {
		    countdown_number_done -= 1;
		    if (countdown_number_done >= 0) {
		        countdown_timer_done = 60;
		    } else {
				room_goto( room_target);
		    }	
		}
	

    
}
