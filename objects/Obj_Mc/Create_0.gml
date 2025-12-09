
hurtSpd = 0
moveSpd = 6.5;
hsp     = 0;     //horizontal speed
vsp     = 0;     //vertical speed

target = noone
team   = 1;
block_angle_tolerance = 0;

// Inisialisasi global
if (!variable_global_exists("oven_dialog_open")) {
    global.oven_dialog_open = false;
}
// buat variabel global pertama kali
if (!variable_global_exists("portal_cooldown")) {
    global.portal_cooldown = false;
}
talking = true;

idle  = 1;
kanan  = MC_hadapKanan;
kiri   = MC_hadapKiri;
atas = MC_Naik;
bawah = MC_turun;
bergerak = true;
sprite_index = idle;
my_name = "Evan"; // atau Charlie, atau apa pun
path_step = 0;


