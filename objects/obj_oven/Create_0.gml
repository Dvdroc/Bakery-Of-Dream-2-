// Event Create di obj_oven
// Variabel Wajib untuk menghindari crash saat Obj_Mc mengaksesnya
dialog_lines = ["Daftar resep dimuat."]; // Harus Array
dialog_index = 0;
char_name = "Oven Kue";
visible = false;


// Tambahkan variabel ini jika Anda menggunakan logika dari respons sebelumnya
// global.recipes (harus diisi di obj_game_manager atau di sini)
// global.baked_goods (harus diisi di obj_game_manager atau di sini)