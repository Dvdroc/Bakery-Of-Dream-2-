/// @description Insert description here
// You can write your code in this editor
if(global.date){
	// Draw sprite textbox
	draw_sprite_ext(textbox2, image_index, 20, 20, 1.6 , 1, 0, c_grey, 1);
	draw_sprite_ext(waktu, image_index, room_width/2 - 100 , 35, 0.25 , 0.25, 0, c_white, 1);
	// Draw text
	draw_set_color(c_white); // warna teks
	draw_text(40, 35, "day " +  string(global.day));
	draw_text(40, 55, "musim " +  string(global.musim));
	draw_text(40, 75, "waktu " +  string(global.time_of_day));

	draw_set_font(my_font);
	draw_text( room_width/2 - 60, 40,string(global.activity_points));
}
