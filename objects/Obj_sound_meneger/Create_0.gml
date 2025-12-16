if (instance_number(Obj_sound_meneger) > 1) {
    instance_destroy();
    exit;
}
audio_stop_all();
current_bgm = noone;

current_bgm = -1; // ID sound instance
current_bgm_asset = noone; // nama asset
// --- Default Volume (0.0 sampai 1.0) ---
if (!variable_global_exists("vol_master")) global.vol_master = 1.0;
if (!variable_global_exists("vol_music"))  global.vol_music = 0.8;
if (!variable_global_exists("vol_sfx"))    global.vol_sfx = 1.0;

// Terapkan volume awal
audio_group_set_gain(audiogroup_default, global.vol_sfx * global.vol_master, 0);
// Catatan: Jika BGM sudah main, kita update volumenya nanti di Step