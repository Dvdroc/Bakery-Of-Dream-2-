// --- Navigasi Atas/Bawah (Pilih Menu) ---
if(aktif){
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	    selected--;
	    if (selected < 0) selected = array_length(options) - 1;
	    audio_play_sound(Retro_Beeep_06, 1, false); // Bunyi SFX menu
	}
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	    selected++;
	    if (selected >= array_length(options)) selected = 0;
	    audio_play_sound(Retro_Beeep_06, 1, false);
	}

	// --- Navigasi Kiri/Kanan (Ubah Volume) ---
	var ubah = 0;
	if (keyboard_check(vk_left) || keyboard_check(ord("A"))) ubah = -0.01; // Kurangi pelan
	if (keyboard_check(vk_right) || keyboard_check(ord("D"))) ubah = 0.01;  // Tambah pelan

	if (ubah != 0) {
	    switch(selected) {
	        case 0: // Master
	            global.vol_master = clamp(global.vol_master + ubah, 0, 1);
	            break;
	        case 1: // Music
	            global.vol_music = clamp(global.vol_music + ubah, 0, 1);
	            break;
	        case 2: // SFX
	            global.vol_sfx = clamp(global.vol_sfx + ubah, 0, 1);
	            // Test bunyi SFX biar player tau seberapa keras
	            if (!audio_is_playing(Retro_Beeep_06) && random(10) > 8) {
	               var _snd = audio_play_sound(Retro_Beeep_06, 1, false);
	               audio_sound_gain(_snd, global.vol_sfx * global.vol_master, 0);
	            }
	            break;
	    }
    
	    // Update Global Gain untuk SFX (karena BGM dihandle di step obj_sound_meneger)
	    audio_group_set_gain(audiogroup_default, global.vol_sfx * global.vol_master, 0);
	}

	// --- Tombol Keluar / Back ---
	if ((selected == 3 && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))) || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("F"))) {
    
	    // Aktifkan kembali player jika sebelumnya di-freeze
	    if (instance_exists(Obj_Mc)) Obj_Mc.bergerak = true;
    
	    instance_destroy();
	}
}