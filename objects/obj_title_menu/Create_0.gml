// --- KONFIGURASI MENU ---
// Daftar pilihan menu
options = ["NEW GAME", "LOAD GAME", "SETTINGS", "EXIT"];

// Pilihan yang sedang disorot (-1 artinya belum ada yang disorot)
selected = -1;

// Posisi Menu (Tengah Layar)
menu_x = display_get_gui_width() / 2 + 255;
// Mulai dari agak bawah tengah
menu_y_start = display_get_gui_height() / 2 -40; 

// Jarak antar tombol vertikal
gap = 70; 

// Font (Opsional, jika punya font khusus)
// draw_set_font(fnt_menu_utama);