/// @description Insert description here
// You can write your code in this editor
// Gold
gold_total = global.gold;         // gold sebelumnya
gold_gain = 0; // gold yang didapat dari mini-game
gold_display = gold_total;        // gold yang ditampilkan sekarang
gold_target = 0;
countdown_timer = 30;
countdown_number = 3;
timeres_done = 60;
timeres_second = 59;
timeres_minits = 1;
countdown_timer_done = 30;
countdown_number_done = 3;
timer = false
timer_done = false;



if (!variable_global_exists("fnt_score")) {
    fnt_score = font_add("Arial", 64, false, false, 0, 0);
}
if (!variable_global_exists("fnt_big")) {
    fnt_big = font_add("Arial", 20, false, false, 0, 0);
}
// Reputasi
rep_total = global.reputation;         // reputasi sebelum mini-game
rep_gain = 0;
rep_display = rep_total;               // reputasi yang ditampilkan sekarang
rep_target =0;


// Timer / speed animasi
gold_speed = 1;  // bisa adjust sesuai cepat lambat animasi
rep_speed = 1;

// Flag untuk animasi selesai
gold_done = false;
rep_done = false;
