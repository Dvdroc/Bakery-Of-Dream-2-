/// @description Insert description here
// You can write your code in this editor
// Animasi gold
// Turunkan timer berdasarkan fps


// Jangan sampai minus
if(timer){
	if (timeres_done > 0) {
		timeres_done -= 1;
	} else {
		timeres_second -= 1;
		if (timeres_second > 0) {
			timeres_done = 60;
		}else { 
			timeres_minits -= 1;
			if(timeres_minits > 0){
				timeres_second = 60;
			}else {
				timer_done = true;
			}
		}
	}
}

if(global.done >= global.npc_aktiv_target || timer_done){
	show_debug_message("rep_gain = " + string(rep_gain));
	with(obj_dialogue){
		instance_destroy();
	}
	gold_target = gold_total + gold_gain;
	rep_target = rep_total + (rep_gain * global.combo);
	if (!gold_done) {
	    if (gold_display < gold_target) {
	        gold_display += gold_speed;  // naik tiap frame
	        if (gold_display > gold_target) gold_display = gold_target;
	    } else {
	        gold_done = true;  // selesai
	    }
	}

	if (!rep_done) {
	    if (rep_gain > 0) {
	        if (rep_display < rep_target) {
	            rep_display += rep_speed;
	            if (rep_display > rep_target) rep_display = rep_target;
	        } else rep_done = true;
	    } else if (rep_gain < 0) {
	        if (rep_display > rep_target) {
	            rep_display -= rep_speed;
	            if (rep_display < rep_target) rep_display = rep_target;
	        }
	    } else rep_done = true;
	}
	
	if(rep_done && gold_done){
		global.gold = gold_display;
		if (countdown_timer_done > 0) {
		    countdown_timer_done -= 1;
		} else {
		    countdown_number_done -= 1;
		    if (countdown_number_done >= 0) {
		        countdown_timer_done = 60;
		    } else {
		        room_goto(toko_dalam);
		    }	
		}
	}
	
}