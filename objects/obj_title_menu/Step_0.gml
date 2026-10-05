// Ambil posisi mouse di layar GUI
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
with(obj_game_manager) visible = false;

// Reset pilihan setiap frame (agar tidak nyangkut jika mouse menjauh)
selected = -1;

// --- 1. DETEKSI HOVER MOUSE ---
// Kita cek satu per satu area tombolnya
for (var i = 0; i < array_length(options); i++) {
    
    // Perkiraan area tombol (Sesuaikan lebar/tinggi jika perlu)
    var button_w = 200; // Setengah lebar dari tengah (total lebar 400)
    var button_h = 25;  // Setengah tinggi dari tengah (total tinggi 50)
    
    var yy = menu_y_start + (i * gap);
    
    // Cek apakah mouse ada di dalam area imajiner tombol ini
    if (point_in_rectangle(mx, my, menu_x - button_w, yy - button_h, menu_x + button_w, yy + button_h)) {
        selected = i; // Tandai tombol ini sebagai yang dipilih
        
        // (Opsional) Mainkan suara 'blip' saat hover, tapi harus dijaga biar gak spamming
        // if (selected != previous_selected) audio_play_sound(...)
    }
}


// --- 2. DETEKSI KLIK ---
if (selected != -1 && mouse_check_button_pressed(mb_left)) {
    
    // Bunyi klik (Opsional)
    // audio_play_sound(snd_select, 1, false);

    // --- EKSEKUSI AKSI BERDASARKAN PILIHAN ---
    switch(selected) {
        case 0: // --- NEW GAME ---
            // Pindah ke room gameplay pertama
            room_goto(Room7); 
            break;
            
        case 1: // --- LOAD GAME ---
            // Memanggil script dialog Load yang sudah kita buat sebelumnya
            // Pastikan script 'scr_open_save_dialogue' sudah ada
            with(obj_save_menu){
				aktif = true;
				mode = "load";
				
			}
            break;
            
        case 2: // --- SETTINGS ---
            // Memunculkan object menu settings yang sudah kita buat sebelumnya
            // Pastikan object 'obj_settings_menu' sudah ada
			with(obj_settings_menu) aktif = true;
            if (!instance_exists(obj_settings_menu)) {
                instance_create_depth(0, 0, -9999, obj_settings_menu);
            }
            break;
            
        case 3: // --- EXIT ---
            // Menutup game
            game_end();
            break;
    }
}