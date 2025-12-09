/// @description Insert description here
// You can write your code in this editor
if(timer && !timer_done){
	var menit = timeres_minits;
	var detik = timeres_second;

	draw_text(32, 32, string(menit) + ":" + string_format(detik, 2, 0));
}

if(global.done >= global.npc_aktiv_target || timer_done){
	
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
	// Gold
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_text(room_width/2 - 100, 200, string(floor(gold_display))); // dari kanan
	
	// Tampilkan gold gain di samping kanan (opsional, animasi 12345)
	if (!gold_done) {
	    draw_set_color(c_yellow);
	    draw_text(room_width/2 + 100, 200, "+" + string(gold_gain));
	}

	// Reputasi
	draw_set_color(c_white);
	draw_text(room_width/2 - 100, 300, string(rep_display));
	
	
	if (!rep_done) {
	    draw_set_color(c_yellow);
	    draw_text(room_width/2 + 100, 300, "+" + string(rep_gain));
	}

	// Panah atas/bawah
	
	if(rep_done && gold_done){
		
		// background semi-transparan
		draw_set_alpha(0.5);
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height,false);
		draw_set_alpha(1);
		
		draw_set_font(fnt_big);
		draw_set_color(c_white);
		if (countdown_number_done > 0) {
		    draw_text(397, 430, string(countdown_number_done));
		} else {
			draw_text(347, 430, "good!");
		}
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}


