/// @description Insert description here
// You can write your code in this editor
// Durasi tiap angka dalam frame (misal 30 = 1 detik)
countdown_timer = 30;
countdown_number = 3;
// Create Event
if (!variable_global_exists("fnt_big")) {
    fnt_big = font_add("Arial", 64, false, false, 0, 0);
}
start = false;

count = 0;
box_x = 0 ;
box_y = 0 ;
box_tinggi = room_height ;
box_lebar = room_width ;
