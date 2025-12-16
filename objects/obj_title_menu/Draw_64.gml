draw_set_halign(fa_center); // Rata tengah horizontal
draw_set_valign(fa_middle); // Rata tengah vertikal

// Loop untuk menggambar setiap opsi
for (var i = 0; i < array_length(options); i++) {
    
    var yy = menu_y_start + (i * gap);
    var txt = "";
    var col = c_white; // Warna standar (misal Putih atau Abu-abu)
    var scale = 1;   // Ukuran standar
    
    // Jika tombol ini sedang disorot mouse
    if (i == selected) {
        col = c_yellow; // Ubah warna jadi kuning
        txt = "> " + "                   " + " <"; // Tambah panah di kiri kanan
        scale = 1; // Sedikit perbesar agar kerasa interaktif
    }
    
    // Gambar Teksnya
    draw_set_color(col);
    draw_text_transformed(menu_x, yy, txt, scale, scale, 0);
}

// Reset alignment agar tidak mengganggu gambar lain
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);