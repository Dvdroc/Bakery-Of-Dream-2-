function semua_resep_terbuka() {
    for (var i = 0; i < array_length(global.recipes); i++) {
        if (global.recipes[i].unlocked == false) {
            return true; // ketemu 1 yang masih terkunci → belum semua
        }
    }
    return false; // tidak ada yang locked → semua terbuka
}

