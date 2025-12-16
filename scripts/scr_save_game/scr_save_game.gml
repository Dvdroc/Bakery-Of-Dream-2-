function scr_save_game(_filename) {
    // 1. Bungkus semua data global
    var _save_data = {
        gold: global.gold,
        reputation: global.reputation,
        day: global.day,
        time_of_day: global.time_of_day,
        musim: global.musim,
        stamina: global.stamina,
        recipes: global.recipes, // Array resep
        inventory_data: {}       // Inventory
    };

    // 2. Simpan Inventory (DS Map -> Struct)
    var _keys = ds_map_keys_to_array(global.inventory);
    for (var i = 0; i < array_length(_keys); i++) {
        var _key = _keys[i];
        variable_struct_set(_save_data.inventory_data, _key, global.inventory[? _key]);
    }

    // 3. Simpan ke File (sesuai nama slot)
    var _json = json_stringify(_save_data);
    var _file = file_text_open_write(_filename);
    file_text_write_string(_file, _json);
    file_text_close(_file);

    show_debug_message("Game Saved to: " + _filename);
}