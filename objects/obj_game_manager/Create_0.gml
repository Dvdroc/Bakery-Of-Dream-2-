/// @description Inisialisasi Sistem Crafting

// Pastikan tidak double-initialize
if (!variable_global_exists("recipes")) {

    // === A. Daftar Resep (Hanya untuk referensi) ===
    // Struktur: name, required (array bahan), count (jumlah yang dihasilkan)
    global.recipes = array_create(0);

	array_push(global.recipes,{
		no: 0,
		name: "Brownies Cokelat",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1}, // 100g -> 1
			{bahan: "Cokelat batang", jumlah: 2},               // 150g -> 2
			{bahan: "Mentega", jumlah: 1},                      // 100g -> 1
			{bahan: "Telur", jumlah: 2},                        // 2 butir
			{bahan: "Gula pasir", jumlah: 2}                    // 120g -> 2
		],
		count: 1,
		unlocked: true,
		harga: 129
	});

	array_push(global.recipes,{
		no: 1,
		name: "Cake Keju",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1}, // 100g -> 1
			{bahan: "Keju cheddar", jumlah: 1},                 // 100g -> 1
			{bahan: "Telur", jumlah: 3},                        // 3 butir
			{bahan: "Mentega", jumlah: 1},                      // 100g -> 1
			{bahan: "Susu cair", jumlah: 1},                    // 100ml -> 1
			{bahan: "Gula halus", jumlah: 2}                    // 120g -> 2
		],
		count: 1,
		unlocked: false,
		harga: 135
	});

	array_push(global.recipes,{
		no: 2,
		name: "Choco Lava Cake",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1}, // 50g -> 1 (dibulatkan)
			{bahan: "Cokelat batang", jumlah: 1},               // 100g -> 1
			{bahan: "Mentega", jumlah: 1},                      // 75g -> 1 (dibulatkan)
			{bahan: "Telur", jumlah: 2},                        // 2 butir
			{bahan: "Gula pasir", jumlah: 1}                    // 50g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 115
	});

	// Contoh resep populer musim (Spring)
	array_push(global.recipes,{
		no: 3,
		name: "Strawberry Shortcake",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1},
			{bahan: "Telur", jumlah: 2},
			{bahan: "Mentega", jumlah: 1},
			{bahan: "Gula pasir", jumlah: 1},
			{bahan: "Strawberry", jumlah: 1},
			{bahan: "Whipped cream", jumlah: 1}
		],
		count: 1,
		unlocked: false,
		harga: 147
	});
	
	// Muffin Blueberry
	array_push(global.recipes,{
		no: 4,
		name: "Muffin Blueberry",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 2}, // 120g -> 2
			{bahan: "Telur", jumlah: 1},                        // 1 butir
			{bahan: "Mentega", jumlah: 1},                      // 50g -> 1
			{bahan: "Gula pasir", jumlah: 1},                   // 80g -> 1
			{bahan: "Susu cair", jumlah: 1},                    // 50ml -> 1
			{bahan: "Strawberry", jumlah: 1}                    // Ganti blueberry masuk kategori Buah
		],
		count: 1,
		unlocked: false,
		harga: 130
	});

	// Cheese Tart
	array_push(global.recipes,{
		no: 5,
		name: "Cheese Tart",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 2}, // 150g -> 2
			{bahan: "Mentega", jumlah: 1},                      // 100g -> 1
			{bahan: "Keju cream", jumlah: 1},                   // 100g -> 1
			{bahan: "Telur", jumlah: 2},                        // 2 butir
			{bahan: "Gula halus", jumlah: 1}                    // 50g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 125
	});

	// Donat
	array_push(global.recipes,{
		no: 6,
		name: "Donat",
		required: [
			{bahan: "Tepung terigu protein tinggi", jumlah: 3}, // 250g -> 3
			{bahan: "Ragi instan", jumlah: 1},                  // 7g -> 1
			{bahan: "Gula pasir", jumlah: 1},                   // 50g -> 1
			{bahan: "Telur", jumlah: 1},                        // 1 butir
			{bahan: "Susu cair", jumlah: 1},                    // 120ml -> 1
			{bahan: "Mentega", jumlah: 1}                       // 50g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 126
	});

	// Kue Lumpur
	array_push(global.recipes,{
		no: 7,
		name: "Kue Lumpur",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1}, // 100g -> 1
			{bahan: "Santan", jumlah: 2},                       // 200ml -> 2
			{bahan: "Telur", jumlah: 2},                        // 2 butir
			{bahan: "Gula pasir", jumlah: 1},                   // 80g -> 1
			{bahan: "Kentang", jumlah: 1}                       // 100g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 104
	});
	
	// Kue Cubit
	array_push(global.recipes,{
		no: 8,
		name: "Kue Cubit",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1}, // 100g -> 1
			{bahan: "Telur", jumlah: 2},                        // 2 butir
			{bahan: "Gula pasir", jumlah: 1},                   // 80g -> 1
			{bahan: "Susu cair", jumlah: 1},                    // 50ml -> 1
			{bahan: "Mentega", jumlah: 1}                       // 30g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 107
	});

	// Bolu Gulung
	array_push(global.recipes,{
		no: 9,
		name: "Bolu Gulung",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1}, // 100g -> 1
			{bahan: "Telur", jumlah: 3},                        // 3 butir
			{bahan: "Gula pasir", jumlah: 2},                   // 120g -> 2
			{bahan: "Mentega", jumlah: 1},                      // 50g -> 1
			{bahan: "Cokelat bubuk", jumlah: 1}                 // 20g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 119
	});

	// Kue Nastar
	array_push(global.recipes,{
		no: 10,
		name: "Kue Nastar",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 3}, // 250g -> 3
			{bahan: "Mentega", jumlah: 2},                      // 150g -> 2
			{bahan: "Telur", jumlah: 1},                        // 1 butir
			{bahan: "Selai nanas", jumlah: 1},                  // 100g -> 1
			{bahan: "Gula halus", jumlah: 1}                    // 50g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 135
	});

	// Kue Lapis
	array_push(global.recipes,{
		no: 11,
		name: "Kue Lapis",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 2}, // 200g -> 2
			{bahan: "Tepung beras", jumlah: 1},                 // 50g -> 1
			{bahan: "Santan", jumlah: 4},                       // 400ml -> 4
			{bahan: "Gula pasir", jumlah: 2},                   // 150g -> 2
			{bahan: "Pasta pandan", jumlah: 1}                  // 2 sdm -> 1
		],
		count: 1,
		unlocked: false,
		harga: 132
	});
	// Kastengel
	array_push(global.recipes,{
		no: 12,
		name: "Kastengel",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 2}, // 200g -> 2
			{bahan: "Mentega", jumlah: 2},                      // 150g -> 2
			{bahan: "Keju cheddar", jumlah: 1},                 // 100g -> 1
			{bahan: "Telur", jumlah: 2}                         // 2 butir
		],
		count: 1,
		unlocked: false,
		harga: 133
	});

	// Bolu Kukus Pandan
	array_push(global.recipes,{
		no: 13,
		name: "Bolu Kukus Pandan",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 2}, // 150g -> 2
			{bahan: "Telur", jumlah: 3},                        // 3 butir
			{bahan: "Gula pasir", jumlah: 2},                   // 150g -> 2
			{bahan: "Santan", jumlah: 1},                       // 100ml -> 1
			{bahan: "Pasta pandan", jumlah: 1}                  // 1 sdt -> 1
		],
		count: 1,
		unlocked: false,
		harga: 119
	});

	// Pie Susu
	array_push(global.recipes,{
		no: 14,
		name: "Pie Susu",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 2}, // 150g -> 2
			{bahan: "Mentega", jumlah: 1},                      // 100g -> 1
			{bahan: "Telur", jumlah: 2},                        // 2 butir
			{bahan: "Susu cair", jumlah: 2},                    // 200ml -> 2
			{bahan: "Gula pasir", jumlah: 1}                    // 50g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 124
	});

	// Kue Cubit Cokelat
	array_push(global.recipes,{
		no: 15,
		name: "Kue Cubit Cokelat",
		required: [
			{bahan: "Tepung terigu protein sedang", jumlah: 1}, // 100g -> 1
			{bahan: "Telur", jumlah: 2},                        // 2 butir
			{bahan: "Mentega", jumlah: 1},                      // 30g -> 1
			{bahan: "Susu cair", jumlah: 1},                    // 50ml -> 1
			{bahan: "Gula pasir", jumlah: 1},                   // 80g -> 1
			{bahan: "Cokelat bubuk", jumlah: 1}                 // 20g -> 1
		],
		count: 1,
		unlocked: false,
		harga: 120
	});

	// Donat Kentang
	array_push(global.recipes,{
		no: 16,
		name: "Donat Kentang",
		required: [
			{bahan: "Tepung terigu protein tinggi", jumlah: 2}, // 200g -> 2
			{bahan: "Kentang", jumlah: 2},                       // 150g -> 2
			{bahan: "Ragi instan", jumlah: 1},                  // 7g -> 1
			{bahan: "Gula pasir", jumlah: 1},                   // 50g -> 1
			{bahan: "Telur", jumlah: 1},                        // 1 butir
			{bahan: "Mentega", jumlah: 1},                      // 50g -> 1
			{bahan: "Susu cair", jumlah: 1}                     // 100ml -> 1
		],
		count: 1,
		unlocked: false,
		harga: 132
	});

	// Lemon Tart (Summer)
	
	// Pumpkin Pie (Autumn)
	
	// Gingerbread (Winter)
	

    // === B. Inventaris Bahan Baku (STARTING INVENTORY) ===
    global.inventory = ds_map_create();

	// Kategori Tepung
	ds_map_add(global.inventory, "Tepung terigu protein sedang", 0);
	ds_map_add(global.inventory, "Tepung terigu protein tinggi", 0);
	ds_map_add(global.inventory, "Tepung beras", 0);

	// Kategori Cokelat
	ds_map_add(global.inventory, "Cokelat batang", 0);
	ds_map_add(global.inventory, "Cokelat bubuk", 0);

	// Kategori Keju
	ds_map_add(global.inventory, "Keju cheddar", 0);
	ds_map_add(global.inventory, "Keju cream", 0);

	// Kategori Gula
	ds_map_add(global.inventory, "Gula pasir", 0);
	ds_map_add(global.inventory, "Gula halus", 0);

	// Kategori Mentega
	ds_map_add(global.inventory, "Mentega", 0);

	// Kategori Telur
	ds_map_add(global.inventory, "Telur", 0);

	// Kategori Susu
	ds_map_add(global.inventory, "Susu cair", 0);
	ds_map_add(global.inventory, "Krim", 0);
	ds_map_add(global.inventory, "Whipped cream", 0);

	// Kategori Ragi
	ds_map_add(global.inventory, "Ragi instan", 0);

	// Kategori Santan
	ds_map_add(global.inventory, "Santan", 0);

	// Kategori Sayur
	ds_map_add(global.inventory, "Kentang", 0);
	ds_map_add(global.inventory, "Puree labu", 0);

	// Kategori Buah
	ds_map_add(global.inventory, "Strawberry", 0);
	ds_map_add(global.inventory, "Blueberry", 0);
	ds_map_add(global.inventory, "Lemon juice", 0);
	ds_map_add(global.inventory, "Lemon zest", 0);

	// Kategori Selai
	ds_map_add(global.inventory, "Selai nanas", 0);

	// Kategori Pasta
	ds_map_add(global.inventory, "Pasta pandan", 0);

	// Kategori Rempah
	ds_map_add(global.inventory, "Jahe bubuk", 0);
	ds_map_add(global.inventory, "Kayu manis", 0);
	
	
    // === C. Daftar Kue yang Sudah Dibuat (OUTPUT) ===
    global.baked_goods = array_create(0);

    // === D. Status tambahan ===
    global.dialog_open = false; // untuk mencegah interaksi ganda saat dialog aktif
    global.crafting_in_progress = false; // biar nanti bisa dipakai sistem progress bar
    global.selected_recipe = -1; // jika player memilih resep di UI
}


global.npc_aktif_count = 0;




if (!variable_global_exists("gold")) {
	global.gold = 1000;
}

if (!variable_global_exists("reputation")) {
	global.reputation = 50;
}
// hari
if (!variable_global_exists("day")) {
	global.day = 1;
	global.time_of_day = "pagi";
	global.activity_points = 3;
	global.musim = "semi";
	global.set_musim = 1;
	global.stamina = 0;
	global.kid_spawn_count = 0;  // Berapa kali anak kecil muncul di 10 hari ini
	global.kid_spawn_max = 1; 
	global.highest_reputation = 0;
	global.is_night = false;
}

// obj_game_manager Create Event
my_font = font_add("Arial", 15, false, false, 0, 0);

if(global.highest_reputation < global.reputation){
	global.highest_reputation = global.reputation;
}
// cek jika poin sudah 3
if (global.activity_points <= 0) {

    // reset poin
    global.activity_points = 3 + global.stamina;

    // ganti waktu
    if (global.time_of_day == "pagi") {
        global.time_of_day = "siang";
		global.is_night = false;
    } else if (global.time_of_day == "siang") {
        global.time_of_day = "malam";
    } else if (global.time_of_day == "malam") {
        global.time_of_day = "pagi";
        global.day += 1;
		global.set_musim = global.day;
		global.is_night = true;
    }

    // optional: trigger event sesuai waktu baru
    // misal ubah background, NPC aktif, dll
}

if(global.day == 40) room_goto(Room7);
if (global.set_musim >= 10) {
	// reset poi
    global.set_musim = 1;
	global.kid_spawn_count = 0;

    // ganti waktu
    if (global.musim == "semi") {
        global.musim = "panas";
		array_push(global.recipes,{ no: 17, name: "Lemon Tart", required: [ {bahan: "Tepung terigu protein sedang", jumlah: 2}, {bahan: "Mentega", jumlah: 1}, {bahan: "Telur", jumlah: 2}, {bahan: "Gula halus", jumlah: 2}, {bahan: "Lemon juice", jumlah: 1}, {bahan: "Lemon zest", jumlah: 1} ], count: 1, unlocked: false, harga: 133});
		global.stamina = - 1;
    } else if (global.musim == "panas") {
		array_push(global.recipes,{ no: 18, name: "Pumpkin Pie", required: [ {bahan: "Tepung terigu protein sedang", jumlah: 2}, {bahan: "Mentega", jumlah: 1}, {bahan: "Telur", jumlah: 2}, {bahan: "Gula pasir", jumlah: 2}, {bahan: "Puree labu", jumlah: 2}], count: 1, unlocked: false, harga: 134});
        global.musim = "gugur";
    } else if (global.musim == "gugur") {
		array_push(global.recipes,{ no: 19, name: "Gingerbread", required: [ {bahan: "Tepung terigu protein sedang", jumlah: 2}, {bahan: "Mentega", jumlah: 1}, {bahan: "Telur", jumlah: 2}, {bahan: "Gula halus", jumlah: 2}, {bahan: "Jahe bubuk", jumlah: 1}, {bahan: "Kayu manis", jumlah: 1} ], count: 1, unlocked: false, harga: 126});
        global.time_of_day = "dingin";
    }else if (global.musim == "dingin") {
        global.time_of_day = "semi";
	}

    // optional: trigger event sesuai waktu baru
    // misal ubah background, NPC aktif, dll
}
global.date = true;
global.wrong = 0;
global.combo = 0;
global.done = 0;
if(global.reputation >= 100){
	global.min_npc_aktif = 32;
	global.max_npc_aktif = 32;
}else if(global.reputation >= 90){
	global.min_npc_aktif = 26;
	global.max_npc_aktif = 28;
}else if(global.reputation >= 80){
	global.min_npc_aktif = 21;
	global.max_npc_aktif = 23;
}else if(global.reputation >= 70){
	global.min_npc_aktif = 16;
	global.max_npc_aktif = 17;
}else if(global.reputation >= 60){
	global.min_npc_aktif = 5;
	global.max_npc_aktif = 11;
}else if(global.reputation >= 50){
	global.min_npc_aktif = 5;
	global.max_npc_aktif = 8;
}else if(global.reputation >= 40){
	global.min_npc_aktif = 4;
	global.max_npc_aktif = 7;
}else if(global.reputation >= 30){
	global.min_npc_aktif = 3;
	global.max_npc_aktif = 6;
}else if(global.reputation >= 20){
	global.min_npc_aktif = 2;
	global.max_npc_aktif = 5;
}else if(global.reputation >= 10){
	global.min_npc_aktif = 1;
	global.max_npc_aktif = 5;
}else if(global.reputation < 10){
	global.min_npc_aktif = 1;
	global.max_npc_aktif = 4;
}

global.npc_aktiv_target = irandom_range(global.min_npc_aktif, global.max_npc_aktif);	

if(!variable_global_exists("harga")){
	global.harga = array_create(0);

	// Bahan dasar kue
	array_push(global.harga,{name: "Tepung terigu protein sedang", type: "Tepung", harga: 5});
	array_push(global.harga,{name: "Tepung terigu protein tinggi", type: "Tepung", harga: 6});
	array_push(global.harga,{name: "Cokelat batang", type: "Cokelat", harga: 10});
	array_push(global.harga,{name: "Cokelat bubuk", type: "Cokelat", harga: 8});
	array_push(global.harga,{name: "Mentega", type: "Mentega", harga: 12});
	array_push(global.harga,{name: "Telur", type: "Telur", harga: 2});
	array_push(global.harga,{name: "Gula pasir", type: "Gula", harga: 4});
	array_push(global.harga,{name: "Gula halus", type: "Gula", harga: 5});
	array_push(global.harga,{name: "Susu cair", type: "Susu", harga: 7});
	array_push(global.harga,{name: "Keju cheddar", type: "Keju", harga: 15});
	array_push(global.harga,{name: "Keju cream", type: "Keju", harga: 14});
	array_push(global.harga,{name: "Ragi instan", type: "Ragi", harga: 3});
	array_push(global.harga,{name: "Santan", type: "Santan", harga: 5});
	array_push(global.harga,{name: "Kentang", type: "Sayur", harga: 6});
	array_push(global.harga,{name: "Selai nanas", type: "Selai", harga: 9});
	array_push(global.harga,{name: "Tepung beras", type: "Tepung", harga: 4});
	array_push(global.harga,{name: "Pasta pandan", type: "Pasta", harga: 10});
	array_push(global.harga,{name: "Whipped cream", type: "Krim", harga: 12});
	array_push(global.harga,{name: "Strawberry", type: "Buah", harga: 15});
	array_push(global.harga,{name: "Blueberry", type: "Buah", harga: 20});
	array_push(global.harga,{name: "Lemon juice", type: "Buah", harga: 8});
	array_push(global.harga,{name: "Lemon zest", type: "Buah", harga: 9});
	array_push(global.harga,{name: "Puree labu", type: "Sayur", harga: 10});
	array_push(global.harga,{name: "Krim", type: "Krim", harga: 12});
	array_push(global.harga,{name: "Jahe bubuk", type: "Rempah", harga: 5});
	array_push(global.harga,{name: "Kayu manis", type: "Rempah", harga: 5});

}

if(!variable_global_exists("keinginan")){
	global.keinginan = array_create(0);
	array_push(global.keinginan,{name: "Brownies Cokelat", dialog: "yang manis banget, hitam-hitam gitu, terus kalau digigit agak keras tapi dalemnya lembut. Rasanya cokelat banget, kayak yang bikin senyum-senyum gitu." });
	array_push(global.keinginan,{name: "Choco Lava Cake", dialog: "yang cokelat cairnya keluar pas digigit, kayak gunung meletus gitu! Enak banget hangat-hangatnya." });
	array_push(global.keinginan,{name: "Bolu Gulung", dialog: "Sudah kubilang aku mau makanan yang kayak bolu biasa, tapi digulung gitu deh. Ada isi manisnya di tengah, lembut banget kalau dimakan." });
	array_push(global.keinginan,{name: "Kue Cubit Cokelat", dialog: "yang kecil-kecil banget, muat cuma sekali gigit. Cokelatnya banyak, biasanya ada taburan manis di atasnya. Gemesin banget!" });
}