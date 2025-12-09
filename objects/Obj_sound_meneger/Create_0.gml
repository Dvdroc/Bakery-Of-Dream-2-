if (instance_number(Obj_sound_meneger) > 1) {
    instance_destroy();
    exit;
}
audio_stop_all();
current_bgm = noone;

current_bgm = -1; // ID sound instance
current_bgm_asset = noone; // nama asset
