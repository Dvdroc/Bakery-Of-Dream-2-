/// @description Insert description here
// You can write your code in this editor
// Cek apakah semua NPC sudah berhenti
if (!start && count >= global.npc_aktiv_target) {
    start = true; // mulai countdown
}

if(start){
	if (countdown_timer > 0) {
	    countdown_timer -= 1;
	} else {
	    countdown_number -= 1;
	    if (countdown_number >= 0) {
	        countdown_timer = 60;
	    } else {
	        // Countdown selesai, beri gerak ke player/MC
		
	        with (Obj_Mc) {
	            bergerak = true;
	        }
			with(obj_ScoreDisplay){
				timer = true;
			}
			instance_destroy();
			
	    }
	}
}


