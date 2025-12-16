// Konfigurasi Slot
slot_count = 3;
slot_x = 250;     // Posisi X di layar
slot_y = 100;     // Posisi Y awal
slot_width = 400;
slot_height = 100;
slot_spacing = 20; // Jarak antar slot

// Mode Menu: "save" atau "load"
// Ubah variabel ini tergantung kamu buka menu ini dari mana
mode = "save"; 
aktif = false;
// Cek data tiap slot (untuk ditampilkan di layar)
slot_info = array_create(slot_count, "Empty");

for (var i = 0; i < slot_count; i++) {
    var _fname = "savefile_" + string(i) + ".json";
    if (file_exists(_fname)) {
        // Kalau file ada, kita intip isinya dikit buat info
        var _file = file_text_open_read(_fname);
        var _json = file_text_read_string(_file);
        file_text_close(_file);
        
        var _data = json_parse(_json);
        // Tampilkan info ringkas: "Day 5 - Musim Semi"
        slot_info[i] = "Day " + string(_data.day) + " (" + _data.musim + ")";
    }
}