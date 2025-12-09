/// @description Insert description here
// You can write your code in this editor
if(start){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_big);
	draw_set_color(c_white);

	// background semi-transparan
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);

	if (countdown_number > 0) {
	    draw_text(room_width/2, room_height/2, string(countdown_number));
	} else {
	    draw_text(room_width/2, room_height/2, "GO!");
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
