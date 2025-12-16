/// @description Insert description here
// You can write your code in this editor
start_x1 = 100;
start_y1 = 200;
start_x2 = 300;
start_y2 = 250;
if (keyboard_check(vk_escape)){
	aktif = true;
	if (keyboard_check_pressed(vk_escape)) {
	    if (!instance_exists(obj_settings_menu)) {
	        instance_create_depth(0, 0, -9999, obj_settings_menu);
        
	        // Matikan gerak player saat menu buka
	        if (instance_exists(Obj_Mc)) Obj_Mc.bergerak = false;
	    }
	    else {
	        // Kalau ditekan lagi, tutup menu (logika tutup ada di dalam object menu juga)
	        with(obj_settings_menu) instance_destroy();
	        if (instance_exists(Obj_Mc)) Obj_Mc.bergerak = true;
	    }
	}
}