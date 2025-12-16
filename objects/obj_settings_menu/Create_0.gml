// Posisi Menu
menu_x = display_get_gui_width() / 2;
menu_y = display_get_gui_height() / 2;
width = 400;
height = 300;

// Opsi Menu
options = ["Master Volume", "Music Volume", "SFX Volume", "Back"];
selected = 0;

// Input Delay agar tidak terlalu cepat geser slider
input_cooldown = 0;
aktif = false;