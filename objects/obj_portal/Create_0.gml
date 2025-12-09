/// @description Insert description here
// You can write your code in this editor
visible = false;
room_target = noone; // room tujuan (diisi manual di room editor)
spawn_x = 0;         // posisi x saat spawn di room tujuan
spawn_y = 0;         // posisi y saat spawn di room tujuan
trigger_range = 20;  // jarak player harus 

countdown_timer_done = 30;
countdown_number_done = 1;

alpha_value = 0;      // untuk fade in dari gelap ke terang
fade_speed = 0.05;    // kecepatan perubahan alpha per frame (0.01 - 0.1)
fade_direction = 1;   // 1 = fade in, -1 = fade out
fade_color = c_black;